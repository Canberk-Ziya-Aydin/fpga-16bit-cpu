----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2026 22:27:05
-- Design Name: 
-- Module Name: REG_file - Behavioral
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

entity REG_file is
    Port (
        clk : in STD_LOGIC;

        write_data : in STD_LOGIC_VECTOR (15 downto 0);
        write_adress: in STD_LOGIC_VECTOR (3 downto 0);
        write_enable : in STD_LOGIC;
        reset : in STD_LOGIC;

        read_port_1 : out STD_LOGIC_VECTOR (15 downto 0);
        read_adress_1 : in STD_LOGIC_VECTOR (3 downto 0);
        read_port_2 : out STD_LOGIC_VECTOR (15 downto 0);
        read_adress_2 : in STD_LOGIC_VECTOR (3 downto 0);

        flag_update_en   : in  STD_LOGIC;
        flag_z_in        : in  STD_LOGIC;
        flag_n_in        : in  STD_LOGIC;
        flag_c_in        : in  STD_LOGIC;
        flag_v_in        : in  STD_LOGIC;

        flag_z_out       : out  STD_LOGIC;
        flag_n_out       : out  STD_LOGIC;
        flag_c_out       : out  STD_LOGIC;
        flag_v_out       : out  STD_LOGIC

    );
end REG_file;

architecture Behavioral of REG_file is
    signal r0  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r1  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r2  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r3  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r4  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r5  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r6  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r7  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r8  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r9  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r10 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal r11 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    signal flag_z_reg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal flag_n_reg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); 
    signal flag_c_reg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); 
    signal flag_v_reg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); 

    signal raw_read_1 : STD_LOGIC_VECTOR(15 downto 0);
    signal raw_read_2 : STD_LOGIC_VECTOR(15 downto 0);
begin

with read_adress_1 select
        raw_read_1 <= r0         when "0000",
                          r1         when "0001",
                          r2         when "0010",
                          r3         when "0011",
                          r4         when "0100",
                          r5         when "0101",
                          r6         when "0110",
                          r7         when "0111",
                          r8         when "1000",
                          r9         when "1001",
                          r10        when "1010",
                          r11        when "1011",
                          flag_z_reg when "1100",
                          flag_n_reg when "1101",
                          flag_c_reg when "1110",
                          flag_v_reg when "1111",
                          (others => '0') when others;

    with read_adress_2 select
        raw_read_2 <= r0         when "0000",
                          r1         when "0001",
                          r2         when "0010",
                          r3         when "0011",
                          r4         when "0100",
                          r5         when "0101",
                          r6         when "0110",
                          r7         when "0111",
                          r8         when "1000",
                          r9         when "1001",
                          r10        when "1010",
                          r11        when "1011",
                          flag_z_reg when "1100",
                          flag_n_reg when "1101",
                          flag_c_reg when "1110",
                          flag_v_reg when "1111",
                          (others => '0') when others;
                          
    read_port_1 <= write_data when (write_enable = '1' and write_adress = read_adress_1 and write_adress(3 downto 2) /= "11") else raw_read_1;
    read_port_2 <= write_data when (write_enable = '1' and write_adress = read_adress_2 and write_adress(3 downto 2) /= "11") else raw_read_2;

process (clk)
begin
    if rising_edge(clk) then
            if reset = '1' then 
                r0 <= (others => '0');
                r1 <= (others => '0');
                r2 <= (others => '0');
                r3 <= (others => '0');
                r4 <= (others => '0');
                r5 <= (others => '0');
                r6 <= (others => '0');
                r7 <= (others => '0');
                r8 <= (others => '0');
                r9 <= (others => '0');
                r10 <= (others => '0');
                r11 <= (others => '0');
                flag_z_reg <= (others => '0');
                flag_n_reg <= (others => '0');
                flag_c_reg <= (others => '0');
                flag_v_reg <= (others => '0');
            else
                if write_enable = '1' then
                    case write_adress is
                        when "0000" => r0  <= write_data;
                        when "0001" => r1  <= write_data;
                        when "0010" => r2  <= write_data;
                        when "0011" => r3  <= write_data;
                        when "0100" => r4  <= write_data;
                        when "0101" => r5  <= write_data;
                        when "0110" => r6  <= write_data;
                        when "0111" => r7  <= write_data;
                        when "1000" => r8  <= write_data;
                        when "1001" => r9  <= write_data;
                        when "1010" => r10 <= write_data;
                        when "1011" => r11 <= write_data;
                        when others => null;
                    end case;
                end if;


                if flag_update_en = '1' then
                    flag_z_reg <= (0 => flag_z_in, others => '0');
                    flag_n_reg <= (0 => flag_n_in, others => '0');
                    flag_c_reg <= (0 => flag_c_in, others => '0');
                    flag_v_reg <= (0 => flag_v_in, others => '0');
                end if;
            end if;
        end if;
end process;

flag_z_out <= flag_z_reg(0);
flag_n_out <= flag_n_reg(0);
flag_c_out <= flag_c_reg(0);
flag_v_out <= flag_v_reg(0);

end Behavioral;
