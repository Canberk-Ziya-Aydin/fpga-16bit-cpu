----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2026 00:53:41
-- Design Name: 
-- Module Name: fifo_buffer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo_buffer is
    Port (
        clk : in  STD_LOGIC;
        reset : in STD_LOGIC;
        write_data : in STD_LOGIC_VECTOR(15 downto 0);
        write_enable : in STD_LOGIC;
        read_enable : in STD_LOGIC;
        read_select : in STD_LOGIC_VECTOR(15 downto 0);

        read_data : out STD_LOGIC_VECTOR(15 downto 0)

    );
end fifo_buffer;

architecture Behavioral of fifo_buffer is
    type data_block is array (0 to 31) of STD_LOGIC_VECTOR(15 downto 0);
    signal data : data_block;
    signal read : INTEGER range 0 to 31 := 31;
    signal write : INTEGER range 0 to 31 := 0;
begin
    output: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                read <= 31;
                read_data <= x"0000";

            elsif read_enable = '1' then
                if read_select = x"FFFE" then
                    -- Status read: do not advance the pointer.
                    if (read + 1) mod 32 = write then
                        read_data <= x"0000"; -- Empty
                    elsif write = read then
                        read_data <= x"0002"; -- Full
                    else
                        read_data <= x"0001"; -- Partially full
                    end if;

                elsif read_select = x"FFFF" then
                    if (read + 1) mod 32 = write then
                        read_data <= x"0000";
                    else
                        read_data <= data((read + 1) mod 32);
                        read <= (read + 1) mod 32;
                    end if;
                end if;
            end if;
        end if;
    end process;
    write_buff: process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                write <= 0;
            elsif write_enable = '1' and write /= read then
                data(write) <= write_data;
                write <= (write + 1) mod 32;
            end if;
        end if;
    end process;
end Behavioral;
