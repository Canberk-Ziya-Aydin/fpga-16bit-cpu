----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: MEM_block - Behavioral
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

entity MEM_block is
    Port (
        opcode_in : in  STD_LOGIC_VECTOR (3 downto 0);
        alu_result_in : in  STD_LOGIC_VECTOR (15 downto 0);
        alu_input_a_in : in  STD_LOGIC_VECTOR (15 downto 0);
        alu_input_b_in : in  STD_LOGIC_VECTOR (15 downto 0);
        rd_in : in  STD_LOGIC_VECTOR (3 downto 0);
        reset : in STD_LOGIC;

        bram_address : out STD_LOGIC_VECTOR (15 downto 0);
        bram_data : out STD_LOGIC_VECTOR (15 downto 0);
        bram_write_enable : out STD_LOGIC;
        bram_enable : out STD_LOGIC;
        is_load : out STD_LOGIC;

        rd_out : out STD_LOGIC_VECTOR (3 downto 0);
        alu_result_out : out STD_LOGIC_VECTOR (15 downto 0);
        opcode_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MEM_block;

architecture Behavioral of MEM_block is

begin
    rd_out <= rd_in;
    alu_result_out <= alu_result_in;
    opcode_out <= opcode_in;
    bram_address   <= alu_input_a_in(15 downto 0);
    bram_data      <= alu_input_b_in;

    process(opcode_in, reset)
    begin
        bram_enable <= '0';
        bram_write_enable <= '0';
        is_load <= '0';
        if reset = '0' then
            if opcode_in = "1010" then
                is_load <= '1';
                bram_enable <= '1';
                bram_write_enable <= '0';
            elsif opcode_in = "1011" then
                bram_enable <= '1';
                bram_write_enable <= '1';
            end if;
        end if;
    end process;

end Behavioral;
