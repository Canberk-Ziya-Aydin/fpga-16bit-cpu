----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: ID_EX_reg - Behavioral
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

entity ID_EX_reg is
    Port (
        clk : in STD_LOGIC;
        adress_of_next_instruction : in STD_LOGIC_VECTOR (15 downto 0); 
        read_data1 : in STD_LOGIC_VECTOR (15 downto 0);
        read_data2 : in STD_LOGIC_VECTOR (15 downto 0);
        opcode : in STD_LOGIC_VECTOR (3 downto 0);
        rs1 : in STD_LOGIC_VECTOR (3 downto 0);
        rs2 : in STD_LOGIC_VECTOR (3 downto 0);
        rd : in STD_LOGIC_VECTOR (3 downto 0);
        imm8 : in STD_LOGIC_VECTOR (7 downto 0);
        imm12 : in STD_LOGIC_VECTOR (11 downto 0);
        load_use_flush : in STD_LOGIC;
        branch_taken : in STD_LOGIC;
        reset : in STD_LOGIC;

        --adress_of_next_instruction_out : out STD_LOGIC_VECTOR (15 downto 0); 
        read_data1_out : out STD_LOGIC_VECTOR (15 downto 0);
        read_data2_out : out STD_LOGIC_VECTOR (15 downto 0);
        opcode_out : out STD_LOGIC_VECTOR (3 downto 0);
        rs1_out : out STD_LOGIC_VECTOR (3 downto 0);
        rs2_out : out STD_LOGIC_VECTOR (3 downto 0);
        rd_out : out STD_LOGIC_VECTOR (3 downto 0);
        imm8_out : out STD_LOGIC_VECTOR (7 downto 0);
        imm12_out : out STD_LOGIC_VECTOR (11 downto 0)
        
    );
end ID_EX_reg;

architecture Behavioral of ID_EX_reg is

begin
process (clk)
begin
    if rising_edge(clk) then
        if load_use_flush = '1' or branch_taken = '1' or reset = '1' then
            opcode_out <= "0000";
            read_data1_out <= (others => '0');
            read_data2_out <= (others => '0');
            rs1_out        <= (others => '0');
            rs2_out        <= (others => '0');
            rd_out         <= (others => '0');
            imm8_out       <= (others => '0');
            imm12_out      <= (others => '0');  
        else
            opcode_out <= opcode;
            read_data1_out <= read_data1;
            read_data2_out <= read_data2;
            rs1_out <= rs1;
            rs2_out <= rs2;
            rd_out <= rd;
            imm8_out <= imm8;
            imm12_out <= imm12;
        end if;
    end if;
end process;

end Behavioral;
