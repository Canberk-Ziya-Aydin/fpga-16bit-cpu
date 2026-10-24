library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.ENV.ALL;

-- Standalone functional regression: no vendor IP or CPU is needed.
-- RAM outputs update AFTER the sampling edge, as synchronous BRAM does.
entity tb_vga_driver is
    generic (
        SCREEN_BASE_FOR_TEST : NATURAL := 0;
        FRAMES_TO_TEST : POSITIVE := 2
    );
end tb_vga_driver;

architecture simulation of tb_vga_driver is
    subtype word_type is STD_LOGIC_VECTOR(15 downto 0);
    subtype color_type is STD_LOGIC_VECTOR(2 downto 0);
    type screen_array is array (0 to 12287) of word_type;
    type glyph_array is array (0 to 511) of word_type;

    -- Deliberately asymmetric patterns detect swapped/mirrored rows/columns.
    -- Glyphs 0 and 255 exercise all-background and all-foreground cases.
    function font_bit(g, r, c, version : NATURAL) return STD_LOGIC is
        variable n : NATURAL;
        variable b : NATURAL;
    begin
        if g = 0 then
            b := 0;
        elsif g = 255 then
            b := 1;
        else
            n := (g * 37 + r * 53 + c * 19 + r * c * 7) mod 256;
            b := (n / (2 ** ((r + 2 * c) mod 8))) mod 2;
        end if;
        if (b + version) mod 2 = 1 then
            return '1';
        end if;
        return '0';
    end function;

    function cell_word(i, version : NATURAL) return word_type is
        variable g, fg, bg : NATURAL;
        variable w : word_type := (others => '0');
    begin
        g := (i * 73 + (i / 128) * 11 + version * 41) mod 256;
        fg := (i * 3 + 4 + version) mod 8;
        bg := (i / 5 + 1 + version) mod 8;
        if fg = bg then
            bg := (bg + 1) mod 8;
        end if;
        w(7 downto 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(g, 8));
        w(10 downto 8) := STD_LOGIC_VECTOR(TO_UNSIGNED(fg, 3));
        w(13 downto 11) := STD_LOGIC_VECTOR(TO_UNSIGNED(bg, 3));
        -- Spare bits must not affect the displayed colors or index.
        w(15 downto 14) := "11";
        return w;
    end function;

    function make_screen(version : NATURAL) return screen_array is
        variable mem : screen_array;
    begin
        for i in mem'range loop
            mem(i) := cell_word(i, version);
        end loop;
        return mem;
    end function;

    function make_glyphs(version : NATURAL) return glyph_array is
        variable mem : glyph_array := (others => (others => '1'));
    begin
        -- All unused glyph bits remain 1, to test that they are ignored.
        for g in 0 to 255 loop
            for r in 0 to 4 loop
                for c in 0 to 4 loop
                    if r < 3 then
                        mem(2 * g)(14 - 5 * r - c) := font_bit(g, r, c, version);
                    else
                        mem(2 * g + 1)(9 - 5 * (r - 3) - c) := font_bit(g, r, c, version);
                    end if;
                end loop;
            end loop;
        end loop;
        return mem;
    end function;

    function expected_rgb(px, py, version : NATURAL) return color_type is
        variable w : word_type;
        variable g : NATURAL;
    begin
        if px >= 640 or py >= 480 then
            return "000";
        end if;
        w := cell_word((py / 5) * 128 + px / 5, version);
        g := TO_INTEGER(UNSIGNED(w(7 downto 0)));
        if font_bit(g, py mod 5, px mod 5, version) = '1' then
            return w(10 downto 8);
        end if;
        return w(13 downto 11);
    end function;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal screen_address : STD_LOGIC_VECTOR(15 downto 0);
    signal screen_enable : STD_LOGIC;
    signal screen_data : word_type := (others => '0');
    signal glyph_address : STD_LOGIC_VECTOR(8 downto 0);
    signal glyph_enable : STD_LOGIC;
    signal glyph_data : word_type := (others => '0');
    signal red, green, blue, hsync, vsync : STD_LOGIC;
    signal screen_mem : screen_array := make_screen(0);
    signal glyph_mem : glyph_array := make_glyphs(0);
    signal memory_version : NATURAL range 0 to 1 := 0;
    signal screen_reads : NATURAL := 0;
    signal glyph_reads : NATURAL := 0;
begin
    clk <= not clk after 5 ns;

    dut : entity work.vga_driver
        port map (
            clk => clk, reset => reset,
            screen_address => screen_address,
            screen_enable => screen_enable, screen_data => screen_data,
            glyph_address => glyph_address,
            glyph_enable => glyph_enable, glyph_data => glyph_data,
            vga_red => red, vga_green => green, vga_blue => blue,
            hsync => hsync, vsync => vsync
        );

    ram_models : process(clk)
        variable address_value : NATURAL;
        variable expected_address : NATURAL;
        variable waiting_for_glyph : BOOLEAN := false;
        variable expected_glyph_address : NATURAL range 0 to 511 := 0;
        variable expected_row : NATURAL range 0 to 4 := 0;
        variable w : word_type;
        variable last_screen_enable, last_glyph_enable : STD_LOGIC := '0';
    begin
        if rising_edge(clk) then
            if reset = '1' then
                screen_reads <= 0;
                glyph_reads <= 0;
                screen_data <= (others => '0');
                glyph_data <= (others => '0');
                waiting_for_glyph := false;
                last_screen_enable := '0';
                last_glyph_enable := '0';
            else
                assert not (screen_enable = '1' and last_screen_enable = '1')
                    report "Screen enable was held for multiple edges" severity failure;
                assert not (glyph_enable = '1' and last_glyph_enable = '1')
                    report "Glyph enable was held for multiple edges" severity failure;

                if screen_enable = '1' then
                    assert not waiting_for_glyph
                        report "New screen read before previous glyph read" severity failure;
                    address_value := TO_INTEGER(UNSIGNED(screen_address));
                    expected_address := SCREEN_BASE_FOR_TEST +
                        (((screen_reads / 128) mod 480) / 5) * 128 +
                        (screen_reads mod 128);
                    assert address_value = expected_address
                        report "Screen read order/address incorrect: got " &
                            INTEGER'image(address_value) & ", expected " &
                            INTEGER'image(expected_address) severity failure;
                    assert address_value >= SCREEN_BASE_FOR_TEST and
                           address_value < SCREEN_BASE_FOR_TEST + 12288
                        report "Screen read outside allocated memory" severity failure;
                    w := screen_mem(address_value - SCREEN_BASE_FOR_TEST);
                    screen_data <= w;
                    expected_row := (screen_reads / 128) mod 5;
                    expected_glyph_address := 2 * TO_INTEGER(UNSIGNED(w(7 downto 0)));
                    if expected_row >= 3 then
                        expected_glyph_address := expected_glyph_address + 1;
                    end if;
                    waiting_for_glyph := true;
                    screen_reads <= screen_reads + 1;
                end if;

                if glyph_enable = '1' then
                    assert waiting_for_glyph
                        report "Glyph read without preceding screen read" severity failure;
                    address_value := TO_INTEGER(UNSIGNED(glyph_address));
                    assert address_value = expected_glyph_address
                        report "Glyph index/word address incorrect: got " &
                            INTEGER'image(address_value) & ", expected " &
                            INTEGER'image(expected_glyph_address) severity failure;
                    glyph_data <= glyph_mem(address_value);
                    glyph_reads <= glyph_reads + 1;
                    waiting_for_glyph := false;
                end if;
                last_screen_enable := screen_enable;
                last_glyph_enable := glyph_enable;
            end if;
        end if;
    end process;

    stimulus : process
        variable checks : NATURAL := 0;
        variable first_sample : BOOLEAN := true;
        variable expected_color : color_type;
        variable expected_hs, expected_vs : STD_LOGIC;

        procedure tick is
        begin
            wait until rising_edge(clk);
            wait for 1 ns;
        end procedure;

        procedure check(condition : BOOLEAN; message_text : STRING) is
        begin
            checks := checks + 1;
            assert condition report message_text severity failure;
        end procedure;

        procedure hold_reset is
        begin
            reset <= '1';
            for i in 1 to 3 loop
                tick;
                check(color_type'(red & green & blue) = "000", "Reset did not blank RGB");
                check(hsync = '1' and vsync = '1', "Sync active during reset");
                check(screen_enable = '0' and glyph_enable = '0', "RAM enabled during reset");
                check(screen_address = x"0000" and glyph_address = "000000000",
                      "Addresses not cleared during reset");
            end loop;
            reset <= '0';
        end procedure;

        procedure find_first_pixel is
            variable found : BOOLEAN := false;
        begin
            -- Both versions deliberately give pixel (0,0) a nonblack color.
            for i in 1 to 30 loop
                tick;
                if color_type'(red & green & blue) /= "000" then
                    found := true;
                    exit;
                end if;
                check(hsync = '1' and vsync = '1', "Sync changed during startup preload");
            end loop;
            check(found, "Video did not start after preload");
            check((red & green & blue) = expected_rgb(0, 0, memory_version),
                  "First pixel after reset is incorrect");
        end procedure;

        procedure sample_pixel(px, py : NATURAL) is
        begin
            expected_color := expected_rgb(px, py, memory_version);
            if px >= 656 and px < 752 then expected_hs := '0'; else expected_hs := '1'; end if;
            if py >= 490 and py < 492 then expected_vs := '0'; else expected_vs := '1'; end if;
            for phase in 0 to 3 loop
                if first_sample then
                    first_sample := false;
                else
                    tick;
                end if;
                check((red & green & blue) = expected_color,
                      "RGB mismatch at (" & INTEGER'image(px) & "," & INTEGER'image(py) &
                      "), subcycle " & INTEGER'image(phase));
                check(hsync = expected_hs, "Horizontal sync timing/polarity mismatch");
                check(vsync = expected_vs, "Vertical sync timing/polarity mismatch");
            end loop;
        end procedure;
    begin
        -- Interrupt each phase of a fetch to verify clean restart from reset.
        for interrupted_phase in 1 to 4 loop
            hold_reset;
            for i in 1 to interrupted_phase loop tick; end loop;
        end loop;
        hold_reset;
        find_first_pixel;

        for frame in 0 to FRAMES_TO_TEST - 1 loop
            for py in 0 to 524 loop
                for px in 0 to 799 loop
                    sample_pixel(px, py);
                    -- Emulate new CPU-loaded RAM contents in vertical blank.
                    -- The next frame must use the new glyphs and screen words.
                    if frame = 0 and py = 500 and px = 0 then
                        screen_mem <= make_screen(1);
                        glyph_mem <= make_glyphs(1);
                        memory_version <= 1;
                    end if;
                end loop;
            end loop;
            check(screen_reads = (frame + 1) * 61440 + 1,
                  "Expected one screen read per cell per visible scanline, plus next frame preload");
            check(glyph_reads = screen_reads,
                  "Screen and glyph read counts differ");
            report "Completed frame " & INTEGER'image(frame + 1) &
                   ": pixels, sync, blanking and RAM reads match" severity note;
        end loop;

        -- Explicitly check the first pixels across the final frame boundary.
        for px in 0 to 9 loop sample_pixel(px, 0); end loop;

        -- Reset in active video and verify another complete scanline starts.
        hold_reset;
        find_first_pixel;
        first_sample := true;
        for px in 0 to 799 loop sample_pixel(px, 0); end loop;

        report "OVERALL PASS: " & INTEGER'image(checks) &
               " checks; full-frame RGB, 4-clock pixels, sync, blanking, RAM addressing, " &
               "glyph updates and reset recovery matched" severity note;
        finish;
        wait;
    end process;

    timeout : process
    begin
        wait for 100 ms;
        assert false report "VGA regression timed out" severity failure;
        wait;
    end process;
end simulation;
