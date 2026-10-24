----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2026 13:37:48
-- Design Name: 
-- Module Name: fifo_bram_mux - Behavioral
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

entity fifo_bram_mux is
    Port (
        clk : in STD_LOGIC;
        addra : in STD_LOGIC_VECTOR (15 downto 0);
        douta_bram : in STD_LOGIC_VECTOR (15 downto 0);
        douta_glyph_bram : in STD_LOGIC_VECTOR (15 downto 0);
        douta_fifo : in STD_LOGIC_VECTOR (15 downto 0);
        ena : in STD_LOGIC;
        is_load : in STD_LOGIC;

        douta : out STD_LOGIC_VECTOR (15 downto 0);
        ena_bram : out STD_LOGIC;
        ena_glyph_bram : out STD_LOGIC;
        ena_fifo : out STD_LOGIC
    );
end fifo_bram_mux;

architecture Behavioral of fifo_bram_mux is
    signal fifo_selected : STD_LOGIC := '0';
    signal glyph_selected : STD_LOGIC := '0';
begin
    ena_glyph_bram <= ena when unsigned(addra) >= x"E000" and unsigned(addra) <= x"EFFF" else '0';
    ena_bram <= ena when unsigned(addra) < x"E000" else '0';
    ena_fifo <= ena and is_load when addra = x"FFFE" or addra = x"FFFF" else '0';
    douta <= douta_fifo when fifo_selected = '1' else douta_glyph_bram when glyph_selected = '1' else douta_bram;

    process (clk)
    begin
        if rising_edge(clk) then
            if ena = '1' and is_load = '1' and (addra = x"FFFE" or addra = x"FFFF") then
                fifo_selected <= '1';
            else
                fifo_selected <= '0';
            end if;
            if ena = '1' and addra(15 downto 12) = x"E" then
                glyph_selected <= '1';
            else
                glyph_selected <= '0';
            end if;
        end if; 
    end process;
end Behavioral;
