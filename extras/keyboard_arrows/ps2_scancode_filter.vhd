library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ps2_scancode_filter is
    Port (
        clk            : in  STD_LOGIC;
        scancode_ready : in  STD_LOGIC;
        scancode       : in  STD_LOGIC_VECTOR(7 downto 0);
        fifo_char      : out STD_LOGIC_VECTOR(15 downto 0);
        fifo_trigger   : out STD_LOGIC
    );
end ps2_scancode_filter;

architecture Behavioral of ps2_scancode_filter is
    signal break_seen     : STD_LOGIC := '0';
    signal extended_seen  : STD_LOGIC := '0';
    signal fifo_char_r    : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal fifo_trigger_r : STD_LOGIC := '0';
begin
    fifo_char    <= fifo_char_r;
    fifo_trigger <= fifo_trigger_r;

    process (clk)
    begin
        if rising_edge(clk) then
            fifo_trigger_r <= '0';

            if scancode_ready = '1' then
                if scancode = x"F0" then
                    -- The following scan code is a key release.
                    break_seen <= '1';

                elsif scancode = x"E0" then
                    -- The next key belongs to the extended set.
                    extended_seen <= '1';

                elsif break_seen = '1' then
                    -- Ignore the released key.
                    break_seen <= '0';
                    extended_seen <= '0';

                elsif extended_seen = '1' then
                    extended_seen <= '0';
                    case scancode is
                        when x"75" => fifo_char_r <= x"0028"; fifo_trigger_r <= '1'; -- Up
                        when x"72" => fifo_char_r <= x"0029"; fifo_trigger_r <= '1'; -- Down
                        when x"6B" => fifo_char_r <= x"002A"; fifo_trigger_r <= '1'; -- Left
                        when x"74" => fifo_char_r <= x"002B"; fifo_trigger_r <= '1'; -- Right
                        when x"5A" => fifo_char_r <= x"001C"; fifo_trigger_r <= '1'; -- Keypad Enter
                        when others => null;
                    end case;

                else
                    case scancode is
                        -- Letters: 01 to 1A
                        when x"1C" => fifo_char_r <= x"0001"; fifo_trigger_r <= '1'; -- A
                        when x"32" => fifo_char_r <= x"0002"; fifo_trigger_r <= '1'; -- B
                        when x"21" => fifo_char_r <= x"0003"; fifo_trigger_r <= '1'; -- C
                        when x"23" => fifo_char_r <= x"0004"; fifo_trigger_r <= '1'; -- D
                        when x"24" => fifo_char_r <= x"0005"; fifo_trigger_r <= '1'; -- E
                        when x"2B" => fifo_char_r <= x"0006"; fifo_trigger_r <= '1'; -- F
                        when x"34" => fifo_char_r <= x"0007"; fifo_trigger_r <= '1'; -- G
                        when x"33" => fifo_char_r <= x"0008"; fifo_trigger_r <= '1'; -- H
                        when x"43" => fifo_char_r <= x"0009"; fifo_trigger_r <= '1'; -- I
                        when x"3B" => fifo_char_r <= x"000A"; fifo_trigger_r <= '1'; -- J
                        when x"42" => fifo_char_r <= x"000B"; fifo_trigger_r <= '1'; -- K
                        when x"4B" => fifo_char_r <= x"000C"; fifo_trigger_r <= '1'; -- L
                        when x"3A" => fifo_char_r <= x"000D"; fifo_trigger_r <= '1'; -- M
                        when x"31" => fifo_char_r <= x"000E"; fifo_trigger_r <= '1'; -- N
                        when x"44" => fifo_char_r <= x"000F"; fifo_trigger_r <= '1'; -- O
                        when x"4D" => fifo_char_r <= x"0010"; fifo_trigger_r <= '1'; -- P
                        when x"15" => fifo_char_r <= x"0011"; fifo_trigger_r <= '1'; -- Q
                        when x"2D" => fifo_char_r <= x"0012"; fifo_trigger_r <= '1'; -- R
                        when x"1B" => fifo_char_r <= x"0013"; fifo_trigger_r <= '1'; -- S
                        when x"2C" => fifo_char_r <= x"0014"; fifo_trigger_r <= '1'; -- T
                        when x"3C" => fifo_char_r <= x"0015"; fifo_trigger_r <= '1'; -- U
                        when x"2A" => fifo_char_r <= x"0016"; fifo_trigger_r <= '1'; -- V
                        when x"1D" => fifo_char_r <= x"0017"; fifo_trigger_r <= '1'; -- W
                        when x"22" => fifo_char_r <= x"0018"; fifo_trigger_r <= '1'; -- X
                        when x"35" => fifo_char_r <= x"0019"; fifo_trigger_r <= '1'; -- Y
                        when x"1A" => fifo_char_r <= x"001A"; fifo_trigger_r <= '1'; -- Z

                        -- Special keys
                        when x"66" => fifo_char_r <= x"001B"; fifo_trigger_r <= '1'; -- Backspace
                        when x"5A" => fifo_char_r <= x"001C"; fifo_trigger_r <= '1'; -- Enter
                        when x"29" => fifo_char_r <= x"001D"; fifo_trigger_r <= '1'; -- Space

                        -- Number row: 0 to 9
                        when x"45" => fifo_char_r <= x"001E"; fifo_trigger_r <= '1'; -- 0
                        when x"16" => fifo_char_r <= x"001F"; fifo_trigger_r <= '1'; -- 1
                        when x"1E" => fifo_char_r <= x"0020"; fifo_trigger_r <= '1'; -- 2
                        when x"26" => fifo_char_r <= x"0021"; fifo_trigger_r <= '1'; -- 3
                        when x"25" => fifo_char_r <= x"0022"; fifo_trigger_r <= '1'; -- 4
                        when x"2E" => fifo_char_r <= x"0023"; fifo_trigger_r <= '1'; -- 5
                        when x"36" => fifo_char_r <= x"0024"; fifo_trigger_r <= '1'; -- 6
                        when x"3D" => fifo_char_r <= x"0025"; fifo_trigger_r <= '1'; -- 7
                        when x"3E" => fifo_char_r <= x"0026"; fifo_trigger_r <= '1'; -- 8
                        when x"46" => fifo_char_r <= x"0027"; fifo_trigger_r <= '1'; -- 9

                        when others => null;
                    end case;
                end if;
            end if;
        end if;
    end process;
end Behavioral;