----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: MEM_WB_reg - Behavioral
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

entity MEM_WB_reg is
    Port (
        clk : in STD_LOGIC;

        rd_in : in  STD_LOGIC_VECTOR (3 downto 0);
        opcode_in : in  STD_LOGIC_VECTOR (3 downto 0);
        alu_result_in : in  STD_LOGIC_VECTOR (15 downto 0);
        reset : in STD_LOGIC;

        rd_out : out STD_LOGIC_VECTOR (3 downto 0);
        alu_result_out : out STD_LOGIC_VECTOR (15 downto 0);
        opcode_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MEM_WB_reg;

architecture Behavioral of MEM_WB_reg is

begin
process (clk)
begin
    if rising_edge(clk) then
        if reset = '1' then 
            rd_out <= (others => '0');
            alu_result_out <= (others => '0');
            opcode_out <=  (others => '0'); 
        else
            rd_out <= rd_in;
            alu_result_out <= alu_result_in;
            opcode_out <=  opcode_in; 
        end if;
    end if;
end process;

end Behavioral;
