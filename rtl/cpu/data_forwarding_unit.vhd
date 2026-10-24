----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.08.2026 15:17:00
-- Design Name: 
-- Module Name: data_forwarding_unit - Behavioral
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

entity data_forwarding_unit is
    Port (
        id_ex_read_data1 : in STD_LOGIC_VECTOR (15 downto 0);
        id_ex_read_data2 : in STD_LOGIC_VECTOR (15 downto 0);

        ex_mem_alu_res : in STD_LOGIC_VECTOR (15 downto 0);
        wb_output_data : in STD_LOGIC_VECTOR (15 downto 0);

        ex_mem_opcode : in STD_LOGIC_VECTOR (3 downto 0);
        mem_wb_opcode : in STD_LOGIC_VECTOR (3 downto 0);

        ex_mem_rd : in STD_LOGIC_VECTOR (3 downto 0);
        mem_wb_rd : in STD_LOGIC_VECTOR (3 downto 0);

        id_ex_rs1 : in STD_LOGIC_VECTOR (3 downto 0);
        id_ex_rs2 : in STD_LOGIC_VECTOR (3 downto 0);

        id_ex_opcode : in STD_LOGIC_VECTOR (3 downto 0);
        id_ex_imm8 : in STD_LOGIC_VECTOR (7 downto 0);

        zero_flag_in : in STD_LOGIC;
        negative_flag_in: in STD_LOGIC;
        carryout_flag_in: in STD_LOGIC;
        overflow_flag_in: in STD_LOGIC;

        alu_input_a : out STD_LOGIC_VECTOR (15 downto 0);
        alu_input_b : out STD_LOGIC_VECTOR (15 downto 0)
    );
end data_forwarding_unit;

architecture Behavioral of data_forwarding_unit is

begin
process(id_ex_read_data1, id_ex_read_data2, ex_mem_alu_res, wb_output_data, ex_mem_opcode, mem_wb_opcode, ex_mem_rd, mem_wb_rd, id_ex_rs1, id_ex_rs2, id_ex_opcode, id_ex_imm8, zero_flag_in, negative_flag_in, carryout_flag_in, overflow_flag_in)
    variable ex_is_valid : STD_LOGIC := '0';
    variable wb_is_valid : STD_LOGIC := '0';
    variable match_ex_a : STD_LOGIC := '0';
    variable match_ex_b : STD_LOGIC := '0';
    variable match_wb_a : STD_LOGIC := '0';
    variable match_wb_b : STD_LOGIC := '0';
    variable forward_a : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    variable forward_b : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
begin
        

        if ex_mem_rd = id_ex_rs1 and ex_mem_rd(3 downto 2) /= "11" then
            match_ex_a := '1';
        else
            match_ex_a := '0';
        end if;
        
        if mem_wb_rd = id_ex_rs1 and mem_wb_rd(3 downto 2) /= "11" then
            match_wb_a := '1';
        else
            match_wb_a := '0';
        end if;

        if ex_mem_rd = id_ex_rs2 and ex_mem_rd(3 downto 2) /= "11" then
            match_ex_b := '1';
        else
            match_ex_b := '0';
        end if;
        
        if mem_wb_rd = id_ex_rs2 and mem_wb_rd(3 downto 2) /= "11" then
            match_wb_b := '1';
        else
            match_wb_b := '0';
        end if;

        if (ex_mem_opcode = "0001" or -- ADD
            ex_mem_opcode = "0010" or -- SUB
            ex_mem_opcode = "0011" or -- NAND
            ex_mem_opcode = "0100" or -- SLL
            ex_mem_opcode = "0101" or -- SRL
            ex_mem_opcode = "0110" or -- SLA
            ex_mem_opcode = "0111" or -- SRA
            ex_mem_opcode = "1000" or -- LIL
            ex_mem_opcode = "1001") then -- LIH
            
            ex_is_valid := '1';
        else
            ex_is_valid := '0';
        end if;

        if (mem_wb_opcode = "0001" or -- ADD
            mem_wb_opcode = "0010" or -- SUB
            mem_wb_opcode = "0011" or -- NAND
            mem_wb_opcode = "0100" or -- SLL
            mem_wb_opcode = "0101" or -- SRL
            mem_wb_opcode = "0110" or -- SLA
            mem_wb_opcode = "0111" or -- SRA
            mem_wb_opcode = "1000" or -- LIL
            mem_wb_opcode = "1001" or -- LIH
            mem_wb_opcode = "1010") then -- LOAD
            
            wb_is_valid := '1';
        else
            wb_is_valid := '0';
        end if;

        forward_a(0) := ex_is_valid and match_ex_a;
        forward_a(1) := ((match_wb_a and wb_is_valid) and (not forward_a(0)));
        forward_b(0) := ex_is_valid and match_ex_b;
        forward_b(1) := ((match_wb_b and wb_is_valid) and (not forward_b(0)));

        if id_ex_rs1 = "1100" then
            alu_input_a <= (0 => zero_flag_in, others => '0');
        elsif id_ex_rs1 = "1101" then 
            alu_input_a <= (0 => negative_flag_in, others => '0');
        elsif id_ex_rs1 = "1110" then
            alu_input_a <= (0 => carryout_flag_in, others => '0');
        elsif id_ex_rs1 = "1111" then 
            alu_input_a <= (0 => overflow_flag_in, others => '0');
        else
            if forward_a = "00" then
                alu_input_a <= id_ex_read_data1;
            elsif forward_a = "01" then
                alu_input_a <= ex_mem_alu_res;
            elsif forward_a = "10" then
                alu_input_a <= wb_output_data;
            else
                alu_input_a <= x"0000";
            end if;
        end if;

        if id_ex_opcode = "1000" then
            alu_input_b <= x"00" & id_ex_imm8;
        elsif id_ex_opcode = "1001" then
            alu_input_b <= id_ex_imm8 & x"00";
        else
            if id_ex_rs2 = "1100" then
                alu_input_b <= (0 => zero_flag_in, others => '0');
            elsif id_ex_rs2 = "1101" then 
                alu_input_b <= (0 => negative_flag_in, others => '0');
            elsif id_ex_rs2 = "1110" then
                alu_input_b <= (0 => carryout_flag_in, others => '0');
            elsif id_ex_rs2 = "1111" then 
                alu_input_b <= (0 => overflow_flag_in, others => '0');
            else
                if forward_b = "00" then
                    alu_input_b <= id_ex_read_data2;
                elsif forward_b = "01" then
                    alu_input_b <= ex_mem_alu_res;
                elsif forward_b = "10" then
                    alu_input_b <= wb_output_data;
                else
                    alu_input_b <= x"0000";
                end if;
            end if;
        end if;
 
end process;

end Behavioral;
