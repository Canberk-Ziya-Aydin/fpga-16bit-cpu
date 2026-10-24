----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: IF_ID_reg - Behavioral
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

entity IF_ID_reg is
    Port (
        clk : in STD_LOGIC;
        branch_flush : in  STD_LOGIC;
        adress_of_next_instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
        raw_instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
        adress_of_next_instruction_out : out STD_LOGIC_VECTOR (15 downto 0);
        raw_instruction_out : out STD_LOGIC_VECTOR (15 downto 0);
        enable : in STD_LOGIC;
        reset : in STD_LOGIC
     );
end IF_ID_reg;

architecture Behavioral of IF_ID_reg is

begin
    
process (clk)
begin
    if rising_edge(clk) then
        if reset = '1' then 
            adress_of_next_instruction_out <= (others => '0');
            raw_instruction_out <= (others => '0');
        elsif branch_flush = '1' then
            raw_instruction_out           <= (others => '0'); -- Injects NOP ("0000")
            adress_of_next_instruction_out <= (others => '0'); -- pc counter broken
        elsif enable = '1' then
            adress_of_next_instruction_out <= adress_of_next_instruction_in;
            raw_instruction_out           <= raw_instruction_in;
        end if;
    end if;
end process;

end Behavioral;
