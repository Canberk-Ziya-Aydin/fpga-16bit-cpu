----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: EX_block - Behavioral
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

entity EX_block is
    Port (
        opcode : in STD_LOGIC_VECTOR (3 downto 0);
        alu_input_a : in STD_LOGIC_VECTOR (15 downto 0);
        alu_input_b : in STD_LOGIC_VECTOR (15 downto 0);
        rd : in STD_LOGIC_VECTOR (3 downto 0);
        imm12 : in STD_LOGIC_VECTOR (11 downto 0);
        zero_flag_in : in STD_LOGIC;
        negative_flag_in: in STD_LOGIC;
        carryout_flag_in: in STD_LOGIC;
        overflow_flag_in: in STD_LOGIC;
    
        rd_out: out STD_LOGIC_VECTOR (3 downto 0);

        
        zero_flag : out STD_LOGIC;
        negative_flag: out STD_LOGIC;
        carryout_flag: out STD_LOGIC;
        overflow_flag: out STD_LOGIC;
        
        alu_input_a_out : out STD_LOGIC_VECTOR (15 downto 0);
        alu_input_b_out : out STD_LOGIC_VECTOR (15 downto 0);
        alu_result : out STD_LOGIC_VECTOR (15 downto 0);
        opcode_out : out STD_LOGIC_VECTOR (3 downto 0);
        flag_reg_update : out STD_LOGIC;

        branch_available : out STD_LOGIC;
        branch_adrress : out STD_LOGIC_VECTOR(15 downto 0)
     );
end EX_block;

architecture Behavioral of EX_block is

begin
process(opcode, alu_input_a, alu_input_b, rd, imm12, zero_flag_in, negative_flag_in, carryout_flag_in, overflow_flag_in)
    variable c_in : STD_LOGIC := '0';
    variable a : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable b : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable full_adder_res_17_bit : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');
    variable nand_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable sll_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable sla_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable srl_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable sra_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable lil_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    variable lih_res : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

    
    variable zero_flag_var : STD_LOGIC := '0';
    variable negative_flag_var : STD_LOGIC := '0';
    variable carryout_flag_var : STD_LOGIC := '0';
    variable overflow_flag_var : STD_LOGIC := '0';
begin
    zero_flag_var     := '0';
    negative_flag_var := '0';
    carryout_flag_var := '0';
    overflow_flag_var := '0';

    branch_available <= '0';
    branch_adrress   <= (others => '0');
    alu_result       <= (others => '0');

    rd_out          <= rd;
    opcode_out      <= opcode;
    alu_input_a_out <= alu_input_a;
    alu_input_b_out <= alu_input_b;

    a := alu_input_a;

    c_in := ((not opcode(3)) and (not opcode(2)) and opcode(1) and (not opcode(0))) or ((opcode(3)) and (opcode(2) and (opcode(1)) and (not opcode(0))));

    if c_in = '1' then
        b := not alu_input_b;
    else
        b := alu_input_b;
    end if;

    if c_in = '1' then
        full_adder_res_17_bit := STD_LOGIC_VECTOR(('0' & UNSIGNED(a)) + ('0' & UNSIGNED(b)) + 1);
    else
        full_adder_res_17_bit := STD_LOGIC_VECTOR(('0' & UNSIGNED(a)) + ('0' & UNSIGNED(b)));
    end if;

    --carryout_flag_var <= full_adder_res_17_bit(16);
    --overflow_flag_var <= (a(15) and b(15) and (not full_adder_res_17_bit(15))) or ((not a(15)) and (not b(15)) and full_adder_res_17_bit(15));
    --negative_flag_var <= full_adder_res_17_bit(15);

    nand_res := alu_input_a nand alu_input_b;

    sll_res := alu_input_a(14 downto 0) & '0';
    srl_res := '0' & alu_input_a(15 downto 1);
    sla_res := alu_input_a(14 downto 0) & alu_input_a(0);
    sra_res := alu_input_a(15) & alu_input_a(15 downto 1);

    lil_res := (alu_input_a and x"FF00") or alu_input_b; --for lil, input_a carries Rd and input_b carries imm8
    lih_res := (alu_input_a and x"00FF") or alu_input_b;  --for lih, input_a carries Rd and input_b carries imm8

    if opcode = "0001" or opcode = "0010" then -- ADD ("0001") / SUB ("0010")
        alu_result <= full_adder_res_17_bit(15 downto 0);
    elsif opcode = "0011" then -- NAND
        alu_result <= nand_res;
    elsif opcode = "0100" then -- SLL
        alu_result <= sll_res;
    elsif opcode = "0101" then -- SRL
        alu_result <= srl_res;
    elsif opcode = "0110" then -- SLA
        alu_result <= sla_res;
    elsif opcode = "0111" then -- SRA
        alu_result <= sra_res;
    elsif opcode = "1000" then -- LIL
        alu_result <= lil_res;
    elsif opcode = "1001" then -- LIH
        alu_result <= lih_res;
    elsif opcode = "1100" then -- BEQ
        if zero_flag_in = '1' then
            branch_adrress <= alu_input_a;
            branch_available <= '1';
        else
            branch_adrress <= x"0000";
            branch_available <= '0';
        end if;
    elsif opcode = "1101" then -- BLT
        if overflow_flag_in /= negative_flag_in then
            branch_adrress <= alu_input_a;
            branch_available <= '1';
        else
            branch_adrress <= x"0000";
            branch_available <= '0';
        end if;
    elsif opcode = "1111" then
        branch_adrress <= alu_input_a;
        branch_available <= '1';
    else
        alu_result <= x"0000"; -- Default / NOP / Undefined opcodes
    end if;

        -- generate glag write enable from opcode
    if (opcode = "0001" or opcode = "0010" or opcode = "0011" or opcode = "0100" or opcode = "0101" or opcode = "0110" or opcode = "0111" or opcode = "1110") then
        flag_reg_update <= '1';
    else
        flag_reg_update <= '0';
    end if;

    
    if opcode = "0001" or opcode = "0010" or opcode = "1110" then
        carryout_flag_var := full_adder_res_17_bit(16);
        overflow_flag_var := (a(15) and b(15) and (not full_adder_res_17_bit(15))) or ((not a(15)) and (not b(15)) and full_adder_res_17_bit(15));
        negative_flag_var := full_adder_res_17_bit(15);
        if full_adder_res_17_bit(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    elsif opcode = "0011" then
        negative_flag_var := nand_res(15);
        carryout_flag_var := '0';
        overflow_flag_var := '0';
        if nand_res(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    elsif opcode = "0100" then
        carryout_flag_var := alu_input_a(15);
        negative_flag_var := sll_res(15);
        overflow_flag_var := '0';
        if sll_res(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    elsif opcode = "0110" then
        carryout_flag_var := alu_input_a(15);
        negative_flag_var := sla_res(15);
        overflow_flag_var := '0';
        if sla_res(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    elsif opcode = "0101" then
        carryout_flag_var := alu_input_a(0);
        negative_flag_var := srl_res(15);
        overflow_flag_var := '0';
        if srl_res(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    elsif opcode = "0111" then
        carryout_flag_var := alu_input_a(0);
        negative_flag_var := sra_res(15);
        overflow_flag_var := '0';
        if sra_res(15 downto 0) = x"0000" then
            zero_flag_var := '1';
        else
            zero_flag_var := '0';
        end if;
    end if;

    negative_flag <= negative_flag_var;
    carryout_flag <= carryout_flag_var;
    zero_flag <= zero_flag_var;
    overflow_flag <= overflow_flag_var;
end process;

end Behavioral;
