----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: WB_block - Behavioral
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

entity WB_block is
    Port (
        rd : in  STD_LOGIC_VECTOR (3 downto 0);
        opcode : in  STD_LOGIC_VECTOR (3 downto 0);
        alu_result : in  STD_LOGIC_VECTOR (15 downto 0);
        bram_read_data : in STD_LOGIC_VECTOR (15 downto 0);

        reg_write_data : out STD_LOGIC_VECTOR (15 downto 0);
        reg_write_adress : out STD_LOGIC_VECTOR (3 downto 0);
        reg_write_enable : out STD_LOGIC
    );
end WB_block;

architecture Behavioral of WB_block is
begin
    reg_write_adress <= rd;
process(opcode, rd, alu_result, bram_read_data)
begin
    if opcode = "1010" then
        reg_write_data <= bram_read_data;
    else
        reg_write_data <= alu_result;
    end if;

    if ((opcode = "0001" or opcode = "0010" or opcode = "0011" or opcode = "0100" or opcode = "0101" or opcode = "0110" or opcode = "0111" or opcode = "1000" or opcode = "1001" or opcode = "1010") and rd(3 downto 2) /= "11") then
        reg_write_enable <= '1';
    else
        reg_write_enable <= '0';
    end if;
end process;
end Behavioral;
