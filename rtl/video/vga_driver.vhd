library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- 640 x 480, with unscaled 5 x 5 character cells (128 x 96 cells).
-- clk: 100 MHz. A two-bit overflow divider gives a 25 MHz pixel enable.
-- reset: synchronous, active high.
-- Both RAM read ports must use clk and have ONE-cycle read latency.
-- Disable both optional primitive/core output registers in the RAM IP.
entity vga_driver is
    Port (
        clk   : in STD_LOGIC;
        reset : in STD_LOGIC;

        screen_address : out STD_LOGIC_VECTOR(15 downto 0);
        screen_enable  : out STD_LOGIC;
        screen_data    : in  STD_LOGIC_VECTOR(15 downto 0);

        glyph_address : out STD_LOGIC_VECTOR(8 downto 0);
        glyph_enable  : out STD_LOGIC;
        glyph_data    : in  STD_LOGIC_VECTOR(15 downto 0);

        vga_red   : out STD_LOGIC;
        vga_green : out STD_LOGIC;
        vga_blue  : out STD_LOGIC;
        hsync     : out STD_LOGIC;
        vsync     : out STD_LOGIC
    );
end vga_driver;

architecture Behavioral of vga_driver is
    -- The CPU must reserve 128 * 96 = 12288 words for this screen.
    -- Default screen range: x0000 through x2FFF, inclusive.
    constant SCREEN_BASE : UNSIGNED(15 downto 0) := x"0000";

    type fetch_state_type is (
        IDLE,
        SCREEN_WAIT,
        SCREEN_CAPTURE,
        GLYPH_WAIT,
        GLYPH_CAPTURE
    );
begin
    -- Main RAM occupies x0000 through xDFFF in this system.

    process (clk)
        variable four_bit_counter : UNSIGNED(1 downto 0) := (others => '0');
        variable x : UNSIGNED(9 downto 0) := (others => '0');
        variable y : UNSIGNED(9 downto 0) := (others => '0');

        variable cell_column  : UNSIGNED(9 downto 0) := (others => '0');
        variable cell_row     : UNSIGNED(9 downto 0) := (others => '0');
        variable glyph_column : UNSIGNED(9 downto 0) := (others => '0');
        variable glyph_row    : UNSIGNED(9 downto 0) := (others => '0');

        variable fetch_state : fetch_state_type := IDLE;
        variable fetch_row : NATURAL range 0 to 4 := 0;
        variable fetch_fg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
        variable fetch_bg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

        -- Next cell is fetched while the current cell is being displayed.
        variable next_pixels : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
        variable next_fg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
        variable next_bg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
        variable next_valid : BOOLEAN := false;

        variable current_pixels : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
        variable current_fg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
        variable current_bg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
        variable pixel_color : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

        variable video_started : BOOLEAN := false;
        variable next_line : NATURAL range 0 to 524 := 0;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                four_bit_counter := (others => '0');
                x := (others => '0');
                y := (others => '0');
                cell_column := (others => '0');
                cell_row := (others => '0');
                glyph_column := (others => '0');
                glyph_row := (others => '0');

                fetch_state := IDLE;
                fetch_row := 0;
                fetch_fg := (others => '0');
                fetch_bg := (others => '0');
                next_pixels := (others => '0');
                next_fg := (others => '0');
                next_bg := (others => '0');
                next_valid := false;
                current_pixels := (others => '0');
                current_fg := (others => '0');
                current_bg := (others => '0');
                pixel_color := (others => '0');
                video_started := false;
                next_line := 0;

                screen_address <= (others => '0');
                screen_enable <= '0';
                glyph_address <= (others => '0');
                glyph_enable <= '0';
                vga_red <= '0';
                vga_green <= '0';
                vga_blue <= '0';
                hsync <= '1';
                vsync <= '1';
            else
                -- Each request enables its RAM for one rising edge only.
                screen_enable <= '0';
                glyph_enable <= '0';

                -- A request set here reaches the RAM at the NEXT edge.
                -- Its registered output is consumed on the following edge.
                case fetch_state is
                    when IDLE =>
                        null;

                    when SCREEN_WAIT =>
                        fetch_state := SCREEN_CAPTURE;

                    when SCREEN_CAPTURE =>
                        fetch_fg := screen_data(10 downto 8);
                        fetch_bg := screen_data(13 downto 11);

                        -- Glyph port B uses local addresses 0 through 511.
                        -- Concatenating a word bit multiplies the index by 2.
                        if fetch_row < 3 then
                            glyph_address <= screen_data(7 downto 0) & '0';
                        else
                            glyph_address <= screen_data(7 downto 0) & '1';
                        end if;
                        glyph_enable <= '1';
                        fetch_state := GLYPH_WAIT;

                    when GLYPH_WAIT =>
                        fetch_state := GLYPH_CAPTURE;

                    when GLYPH_CAPTURE =>
                        -- Leftmost pixel is the highest bit of each row.
                        -- Word 0: unused, row 0, row 1, row 2.
                        -- Word 1: six unused bits, row 3, row 4.
                        case fetch_row is
                            when 0 => next_pixels := glyph_data(14 downto 10);
                            when 1 => next_pixels := glyph_data(9 downto 5);
                            when 2 => next_pixels := glyph_data(4 downto 0);
                            when 3 => next_pixels := glyph_data(9 downto 5);
                            when 4 => next_pixels := glyph_data(4 downto 0);
                        end case;
                        next_fg := fetch_fg;
                        next_bg := fetch_bg;
                        next_valid := true;
                        fetch_state := IDLE;
                end case;

                if not video_started then
                    -- Preload cell (0,0) before starting the first scanline.
                    -- This avoids losing the first pixels after reset.
                    if next_valid then
                        video_started := true;
                    elsif fetch_state = IDLE then
                        screen_address <= STD_LOGIC_VECTOR(SCREEN_BASE);
                        screen_enable <= '1';
                        fetch_row := 0;
                        fetch_state := SCREEN_WAIT;
                    end if;
                else
                    -- Natural unsigned overflow: 00, 01, 10, 11, 00...
                    -- This is an enable divider; clk itself is never gated.
                    four_bit_counter := four_bit_counter + 1;

                    if four_bit_counter = "00" then
                        -- 640 active + 16 front + 96 sync + 48 back = 800.
                        if x >= 656 and x < 752 then
                            hsync <= '0';
                        else
                            hsync <= '1';
                        end if;

                        -- 480 active + 10 front + 2 sync + 33 back = 525.
                        if y >= 490 and y < 492 then
                            vsync <= '0';
                        else
                            vsync <= '1';
                        end if;

                        if x < 640 and y < 480 then
                            cell_column := x / 5;
                            cell_row := y / 5;
                            glyph_column := x mod 5;
                            glyph_row := y mod 5;

                            if glyph_column = 0 then
                                -- synthesis translate_off
                                assert next_valid
                                    report "VGA prefetch missed a cell boundary"
                                    severity failure;
                                -- synthesis translate_on
                                current_pixels := next_pixels;
                                current_fg := next_fg;
                                current_bg := next_bg;
                                next_valid := false;

                                -- Prepare the next cell during this cell's
                                -- 5 pixels, which take 20 system clocks.
                                if cell_column < 127 then
                                    screen_address <= STD_LOGIC_VECTOR(
                                        SCREEN_BASE + TO_UNSIGNED(
                                            TO_INTEGER(cell_row) * 128 +
                                            TO_INTEGER(cell_column) + 1, 16));
                                    screen_enable <= '1';
                                    fetch_row := TO_INTEGER(glyph_row);
                                    fetch_state := SCREEN_WAIT;
                                end if;
                            end if;

                            if current_pixels(4 - TO_INTEGER(glyph_column)) = '1' then
                                pixel_color := current_fg;
                            else
                                pixel_color := current_bg;
                            end if;
                        else
                            -- VGA requires black throughout both porches
                            -- and sync intervals, irrespective of RAM data.
                            pixel_color := (others => '0');
                        end if;

                        -- Color encoding is RGB: bit 2 red, 1 green, 0 blue.
                        vga_red <= pixel_color(2);
                        vga_green <= pixel_color(1);
                        vga_blue <= pixel_color(0);

                        -- Near the end of horizontal blanking, prepare the
                        -- first cell of the next visible scanline. This also
                        -- handles the last blank line before a new frame.
                        if x = 795 then
                            if y = 524 then
                                next_line := 0;
                            else
                                next_line := TO_INTEGER(y) + 1;
                            end if;

                            if next_line < 480 then
                                screen_address <= STD_LOGIC_VECTOR(
                                    SCREEN_BASE + TO_UNSIGNED(
                                        (next_line / 5) * 128, 16));
                                screen_enable <= '1';
                                fetch_row := next_line mod 5;
                                fetch_state := SCREEN_WAIT;
                            end if;
                        end if;

                        -- x advances once per pixel. y advances once per line.
                        if x = 799 then
                            x := (others => '0');
                            if y = 524 then
                                y := (others => '0');
                            else
                                y := y + 1;
                            end if;
                        else
                            x := x + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
