----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: IF_block - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IF_block is
    Port (
        clk : in STD_LOGIC;
        ram_output_data : in STD_LOGIC_VECTOR (15 downto 0);
        branch_available : in STD_LOGIC;
        branch_target : in STD_LOGIC_VECTOR (15 downto 0);
        ram_rw : out STD_LOGIC;
        ram_enable : out STD_LOGIC;
        ram_adress : out STD_LOGIC_VECTOR(14 downto 0);
        adress_of_next_instruction : out STD_LOGIC_VECTOR (15 downto 0);
        raw_instruction : out STD_LOGIC_VECTOR (15 downto 0);
        pc_enable : in STD_LOGIC;
        reset : in STD_LOGIC
    );
end IF_block;

architecture Behavioral of IF_block is
    signal programm_counter : UNSIGNED (15 downto 0) := (others => '0'); --next ram address
    signal response_pc : UNSIGNED (15 downto 0) := (others => '0'); --current arriving instruction ram address
    signal selected_fetch_address : UNSIGNED (15 downto 0); --address in this clk edge
    signal response_valid : STD_LOGIC := '0';
begin
    selected_fetch_address <= unsigned(branch_target) --branch overwrite
        when branch_available = '1'
        else programm_counter;
    
    ram_adress <= STD_LOGIC_VECTOR(selected_fetch_address(14 downto 0));

    ram_enable <= '0' when reset = '1' else branch_available or pc_enable; --branch available enables ram so that branch target adress can be loaded to ram
    ram_rw <= '0';
    raw_instruction <= ram_output_data when response_valid = '1' else (others => '0'); --sends nop until first read

    adress_of_next_instruction <= STD_LOGIC_VECTOR(response_pc + 1);
process (clk)
begin
    if rising_edge(clk) then
    if reset = '1' then 
        programm_counter <= (others => '0');
        response_pc     <= (others => '0');
        response_valid  <= '0';
    elsif branch_available = '1' then
        response_pc <= UNSIGNED(branch_target); --ram recieves branch target
        programm_counter <= UNSIGNED(branch_target)+ 1; --next instruction after branch
        response_valid <= '1';
    elsif pc_enable = '1' then
        response_pc <= programm_counter; --ram recieves pc adress
        programm_counter <= programm_counter + 1; --next instruction
        response_valid <= '1';
    end if;
end if;
end process;

end Behavioral;
