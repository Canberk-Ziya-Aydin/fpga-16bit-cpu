library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use std.env.all;
entity cpu_program_tb is
  generic (ROM_FILE: string := "rom_words.txt";
           EXPECTED_FILE: string := "expected_words.txt";
           REQUIRE_LAST_ROM: boolean := false;
           MIN_LOAD_STALLS: natural := 0);
end;
architecture test of cpu_program_tb is
  signal EX_MEM_reg_0_alu_input_a_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_MEM_reg_0_alu_input_b_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_MEM_reg_0_alu_result_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_MEM_reg_0_opcode_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal EX_MEM_reg_0_rd_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal EX_block_0_alu_input_a_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_block_0_alu_input_b_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_block_0_alu_result: std_logic_vector(15 downto 0) := (others=>'0');
  signal EX_block_0_carryout_flag: std_logic := '0';
  signal EX_block_0_flag_reg_update: std_logic := '0';
  signal EX_block_0_negative_flag: std_logic := '0';
  signal EX_block_0_opcode_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal EX_block_0_overflow_flag: std_logic := '0';
  signal EX_block_0_rd_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal EX_block_0_zero_flag: std_logic := '0';
  signal ID_EX_reg_0_imm12_out: std_logic_vector(11 downto 0) := (others=>'0');
  signal ID_EX_reg_0_imm8_out: std_logic_vector(7 downto 0) := (others=>'0');
  signal ID_EX_reg_0_opcode_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_EX_reg_0_rd_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_EX_reg_0_read_data1_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_EX_reg_0_read_data2_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_EX_reg_0_rs1_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_EX_reg_0_rs2_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_adress_of_next_instruction_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_block_0_branch_available: std_logic := '0';
  signal ID_block_0_branch_target: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_block_0_id_ex_flush: std_logic := '0';
  signal ID_block_0_if_id_enable: std_logic := '0';
  signal ID_block_0_imm8: std_logic_vector(7 downto 0) := (others=>'0');
  signal ID_block_0_imm12: std_logic_vector(11 downto 0) := (others=>'0');
  signal ID_block_0_opcode: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_pc_enable: std_logic := '0';
  signal ID_block_0_rd: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_read_data1: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_block_0_read_data2: std_logic_vector(15 downto 0) := (others=>'0');
  signal ID_block_0_reg_adress1: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_reg_adress2: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_rs1: std_logic_vector(3 downto 0) := (others=>'0');
  signal ID_block_0_rs2: std_logic_vector(3 downto 0) := (others=>'0');
  signal IF_ID_reg_0_adress_of_raw_instruction_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal IF_ID_reg_0_raw_instruction_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal IF_block_0_adress_of_next_instruction: std_logic_vector(15 downto 0) := (others=>'0');
  signal IF_block_0_ram_adress: std_logic_vector(14 downto 0) := (others=>'0');
  signal IF_block_0_ram_enable: std_logic := '0';
  signal IF_block_0_raw_instruction: std_logic_vector(15 downto 0) := (others=>'0');
  signal MEM_WB_reg_0_alu_result_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal MEM_WB_reg_0_opcode_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal MEM_WB_reg_0_rd_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal MEM_block_0_alu_result_out: std_logic_vector(15 downto 0) := (others=>'0');
  signal MEM_block_0_bram_address: std_logic_vector(15 downto 0) := (others=>'0');
  signal MEM_block_0_bram_data: std_logic_vector(15 downto 0) := (others=>'0');
  signal MEM_block_0_bram_enable: std_logic := '0';
  signal MEM_block_0_bram_write_enable: std_logic := '0';
  signal MEM_block_0_is_load: std_logic := '0';
  signal MEM_block_0_opcode_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal MEM_block_0_rd_out: std_logic_vector(3 downto 0) := (others=>'0');
  signal REG_file_0_flag_c_out: std_logic := '0';
  signal REG_file_0_flag_n_out: std_logic := '0';
  signal REG_file_0_flag_v_out: std_logic := '0';
  signal REG_file_0_flag_z_out: std_logic := '0';
  signal REG_file_0_read_port_1: std_logic_vector(15 downto 0) := (others=>'0');
  signal REG_file_0_read_port_2: std_logic_vector(15 downto 0) := (others=>'0');
  signal WB_block_0_reg_write_adress: std_logic_vector(3 downto 0) := (others=>'0');
  signal WB_block_0_reg_write_data: std_logic_vector(15 downto 0) := (others=>'0');
  signal WB_block_0_reg_write_enable: std_logic := '0';
  signal blk_mem_gen_0_douta: std_logic_vector(15 downto 0) := (others=>'0');
  signal clk: std_logic := '0';
  signal data_forwarding_unit_0_alu_input_a: std_logic_vector(15 downto 0) := (others=>'0');
  signal data_forwarding_unit_0_alu_input_b: std_logic_vector(15 downto 0) := (others=>'0');
  signal fifo_bram_mux_0_douta: std_logic_vector(15 downto 0) := (others=>'0');
  signal reset: std_logic := '1';
  type rom_type is array(0 to 32767) of std_logic_vector(15 downto 0);
  impure function load_rom return rom_type is
    file f: text open read_mode is ROM_FILE;
    variable l: line;
    variable r: rom_type;
  begin
    for i in r'range loop readline(f,l); hread(l,r(i)); end loop;
    return r;
  end;
  constant rom: rom_type := load_rom;
  type ram_type is array(0 to 57343) of std_logic_vector(15 downto 0);
  signal ram: ram_type := (others=>(others=>'0'));
  function num(s: std_logic_vector) return natural is
  begin
    assert not is_x(s) report "Unknown trace vector" severity failure;
    return to_integer(unsigned(s));
  end;
  function num(s: std_logic) return natural is
  begin
    assert s='0' or s='1' report "Unknown trace bit" severity failure;
    if s='1' then return 1; else return 0; end if;
  end;
begin
  clk <= not clk after 5 ns;
  process begin wait for 201 ns; reset <= '0'; wait; end process;
  EX_MEM_reg_0: entity work.EX_MEM_reg port map (
    clk => clk,
    rd_in => EX_block_0_rd_out,
    alu_result_in => EX_block_0_alu_result,
    alu_input_a_in => EX_block_0_alu_input_a_out,
    alu_input_b_in => EX_block_0_alu_input_b_out,
    opcode_in => EX_block_0_opcode_out,
    reset => reset,
    rd_out => EX_MEM_reg_0_rd_out,
    alu_result_out => EX_MEM_reg_0_alu_result_out,
    alu_input_a_out => EX_MEM_reg_0_alu_input_a_out,
    alu_input_b_out => EX_MEM_reg_0_alu_input_b_out,
    opcode_out => EX_MEM_reg_0_opcode_out
  );
  EX_block_0: entity work.EX_block port map (
    opcode => ID_EX_reg_0_opcode_out,
    alu_input_a => data_forwarding_unit_0_alu_input_a,
    alu_input_b => data_forwarding_unit_0_alu_input_b,
    rd => ID_EX_reg_0_rd_out,
    imm12 => ID_EX_reg_0_imm12_out,
    zero_flag_in => REG_file_0_flag_z_out,
    negative_flag_in => REG_file_0_flag_n_out,
    carryout_flag_in => REG_file_0_flag_c_out,
    overflow_flag_in => REG_file_0_flag_v_out,
    rd_out => EX_block_0_rd_out,
    zero_flag => EX_block_0_zero_flag,
    negative_flag => EX_block_0_negative_flag,
    carryout_flag => EX_block_0_carryout_flag,
    overflow_flag => EX_block_0_overflow_flag,
    alu_input_a_out => EX_block_0_alu_input_a_out,
    alu_input_b_out => EX_block_0_alu_input_b_out,
    alu_result => EX_block_0_alu_result,
    opcode_out => EX_block_0_opcode_out,
    flag_reg_update => EX_block_0_flag_reg_update,
    branch_available => ID_block_0_branch_available,
    branch_adrress => ID_block_0_branch_target
  );
  ID_EX_reg_0: entity work.ID_EX_reg port map (
    clk => clk,
    adress_of_next_instruction => ID_block_0_adress_of_next_instruction_out,
    read_data1 => ID_block_0_read_data1,
    read_data2 => ID_block_0_read_data2,
    opcode => ID_block_0_opcode,
    rs1 => ID_block_0_rs1,
    rs2 => ID_block_0_rs2,
    rd => ID_block_0_rd,
    imm8 => ID_block_0_imm8,
    imm12 => ID_block_0_imm12,
    load_use_flush => ID_block_0_id_ex_flush,
    branch_taken => ID_block_0_branch_available,
    reset => reset,
    read_data1_out => ID_EX_reg_0_read_data1_out,
    read_data2_out => ID_EX_reg_0_read_data2_out,
    opcode_out => ID_EX_reg_0_opcode_out,
    rs1_out => ID_EX_reg_0_rs1_out,
    rs2_out => ID_EX_reg_0_rs2_out,
    rd_out => ID_EX_reg_0_rd_out,
    imm8_out => ID_EX_reg_0_imm8_out,
    imm12_out => ID_EX_reg_0_imm12_out
  );
  ID_block_0: entity work.ID_block port map (
    adress_of_next_instruction_in => IF_ID_reg_0_adress_of_raw_instruction_out,
    raw_instruction => IF_ID_reg_0_raw_instruction_out,
    adress_of_next_instruction_out => ID_block_0_adress_of_next_instruction_out,
    read_data1 => ID_block_0_read_data1,
    read_data2 => ID_block_0_read_data2,
    opcode => ID_block_0_opcode,
    rs2 => ID_block_0_rs2,
    imm8 => ID_block_0_imm8,
    imm12 => ID_block_0_imm12,
    rs1 => ID_block_0_rs1,
    rd => ID_block_0_rd,
    reg_adress1 => ID_block_0_reg_adress1,
    reg_adress2 => ID_block_0_reg_adress2,
    reg_read_data1 => REG_file_0_read_port_1,
    reg_read_data2 => REG_file_0_read_port_2,
    id_ex_opcode_in => ID_EX_reg_0_opcode_out,
    id_ex_rd_in => ID_EX_reg_0_rd_out,
    pc_enable => ID_block_0_pc_enable,
    if_id_enable => ID_block_0_if_id_enable,
    id_ex_flush => ID_block_0_id_ex_flush
  );
  IF_ID_reg_0: entity work.IF_ID_reg port map (
    clk => clk,
    branch_flush => ID_block_0_branch_available,
    adress_of_next_instruction_in => IF_block_0_adress_of_next_instruction,
    raw_instruction_in => IF_block_0_raw_instruction,
    adress_of_next_instruction_out => IF_ID_reg_0_adress_of_raw_instruction_out,
    raw_instruction_out => IF_ID_reg_0_raw_instruction_out,
    enable => ID_block_0_if_id_enable,
    reset => reset
  );
  IF_block_0: entity work.IF_block port map (
    clk => clk,
    ram_output_data => blk_mem_gen_0_douta,
    branch_available => ID_block_0_branch_available,
    branch_target => ID_block_0_branch_target,
    ram_rw => open,
    ram_enable => IF_block_0_ram_enable,
    ram_adress => IF_block_0_ram_adress,
    adress_of_next_instruction => IF_block_0_adress_of_next_instruction,
    raw_instruction => IF_block_0_raw_instruction,
    pc_enable => ID_block_0_pc_enable,
    reset => reset
  );
  MEM_WB_reg_0: entity work.MEM_WB_reg port map (
    clk => clk,
    rd_in => MEM_block_0_rd_out,
    opcode_in => MEM_block_0_opcode_out,
    alu_result_in => MEM_block_0_alu_result_out,
    reset => reset,
    rd_out => MEM_WB_reg_0_rd_out,
    alu_result_out => MEM_WB_reg_0_alu_result_out,
    opcode_out => MEM_WB_reg_0_opcode_out
  );
  MEM_block_0: entity work.MEM_block port map (
    opcode_in => EX_MEM_reg_0_opcode_out,
    alu_result_in => EX_MEM_reg_0_alu_result_out,
    alu_input_a_in => EX_MEM_reg_0_alu_input_a_out,
    alu_input_b_in => EX_MEM_reg_0_alu_input_b_out,
    rd_in => EX_MEM_reg_0_rd_out,
    reset => reset,
    bram_address => MEM_block_0_bram_address,
    bram_data => MEM_block_0_bram_data,
    bram_write_enable => MEM_block_0_bram_write_enable,
    bram_enable => MEM_block_0_bram_enable,
    is_load => MEM_block_0_is_load,
    rd_out => MEM_block_0_rd_out,
    alu_result_out => MEM_block_0_alu_result_out,
    opcode_out => MEM_block_0_opcode_out
  );
  REG_file_0: entity work.REG_file port map (
    clk => clk,
    write_data => WB_block_0_reg_write_data,
    write_adress => WB_block_0_reg_write_adress,
    write_enable => WB_block_0_reg_write_enable,
    reset => reset,
    read_port_1 => REG_file_0_read_port_1,
    read_adress_1 => ID_block_0_reg_adress1,
    read_port_2 => REG_file_0_read_port_2,
    read_adress_2 => ID_block_0_reg_adress2,
    flag_update_en => EX_block_0_flag_reg_update,
    flag_z_in => EX_block_0_zero_flag,
    flag_n_in => EX_block_0_negative_flag,
    flag_c_in => EX_block_0_carryout_flag,
    flag_v_in => EX_block_0_overflow_flag,
    flag_z_out => REG_file_0_flag_z_out,
    flag_n_out => REG_file_0_flag_n_out,
    flag_c_out => REG_file_0_flag_c_out,
    flag_v_out => REG_file_0_flag_v_out
  );
  WB_block_0: entity work.WB_block port map (
    rd => MEM_WB_reg_0_rd_out,
    opcode => MEM_WB_reg_0_opcode_out,
    alu_result => MEM_WB_reg_0_alu_result_out,
    bram_read_data => fifo_bram_mux_0_douta,
    reg_write_data => WB_block_0_reg_write_data,
    reg_write_adress => WB_block_0_reg_write_adress,
    reg_write_enable => WB_block_0_reg_write_enable
  );
  data_forwarding_unit_0: entity work.data_forwarding_unit port map (
    id_ex_read_data1 => ID_EX_reg_0_read_data1_out,
    id_ex_read_data2 => ID_EX_reg_0_read_data2_out,
    ex_mem_alu_res => EX_MEM_reg_0_alu_result_out,
    wb_output_data => WB_block_0_reg_write_data,
    ex_mem_opcode => EX_MEM_reg_0_opcode_out,
    mem_wb_opcode => MEM_WB_reg_0_opcode_out,
    ex_mem_rd => EX_MEM_reg_0_rd_out,
    mem_wb_rd => MEM_WB_reg_0_rd_out,
    id_ex_rs1 => ID_EX_reg_0_rs1_out,
    id_ex_rs2 => ID_EX_reg_0_rs2_out,
    id_ex_opcode => ID_EX_reg_0_opcode_out,
    id_ex_imm8 => ID_EX_reg_0_imm8_out,
    zero_flag_in => REG_file_0_flag_z_out,
    negative_flag_in => REG_file_0_flag_n_out,
    carryout_flag_in => REG_file_0_flag_c_out,
    overflow_flag_in => REG_file_0_flag_v_out,
    alu_input_a => data_forwarding_unit_0_alu_input_a,
    alu_input_b => data_forwarding_unit_0_alu_input_b
  );

  -- One-clock synchronous memories, without an extra output register.
  process(clk)
    variable a: natural;
  begin
    if rising_edge(clk) then
      if IF_block_0_ram_enable='1' then
        blk_mem_gen_0_douta <= rom(to_integer(unsigned(IF_block_0_ram_adress)));
      end if;
      if MEM_block_0_bram_enable='1' then
        a := to_integer(unsigned(MEM_block_0_bram_address));
        assert a<=57343 report "Unexpected glyph/MMIO access" severity failure;
        fifo_bram_mux_0_douta <= ram(a);
        if MEM_block_0_bram_write_enable='1' then ram(a) <= MEM_block_0_bram_data; end if;
      end if;
    end if;
  end process;

  stimulus: process
    file expected: text open read_mode is EXPECTED_FILE;
    variable l: line;
    variable address, value: std_logic_vector(15 downto 0);
    variable last_seen: boolean := false;
    variable stalls, taken, checked: natural := 0;
    variable completed: boolean := false;
  begin
    wait until reset='0';
    for cycle in 1 to 200000 loop
      wait until rising_edge(clk);
      if IF_block_0_ram_enable='1' and IF_block_0_ram_adress=std_logic_vector(to_unsigned(32767,15)) then
        last_seen := true;
      end if;
      if ID_block_0_pc_enable='0' then stalls:=stalls+1;end if;
      if ID_block_0_branch_available='1' then taken:=taken+1;end if;
      wait for 1 ns;
      if ram(16#30F4#)=x"CAFE" then completed:=true;exit;end if;
    end loop;
    assert completed report "TIMEOUT: diagnostic did not finish" severity failure;
    assert ram(16#30F0#)=x"600D" report "Firmware FAIL: check=" & to_hstring(ram(16#30F1#)) &
      " actual=" & to_hstring(ram(16#30F2#)) & " expected=" & to_hstring(ram(16#30F3#)) severity failure;
    while not endfile(expected) loop
      readline(expected,l);hread(l,address);hread(l,value);
      assert ram(to_integer(unsigned(address)))=value
        report "RAM mismatch at " & to_hstring(address) & ": actual=" &
        to_hstring(ram(to_integer(unsigned(address)))) & " expected=" & to_hstring(value) severity failure;
      checked:=checked+1;
    end loop;
    assert not REQUIRE_LAST_ROM or last_seen report "ROM 7FFF was not fetched" severity failure;
    assert stalls>=MIN_LOAD_STALLS report "Expected LOAD-use dependencies were not exercised" severity failure;
    report "PASS: " & integer'image(checked) & " RAM/screen words checked; " & integer'image(stalls) &
      " LOAD-use stalls; " & integer'image(taken) & " taken branches; ROM 7FFF=" & boolean'image(last_seen);
    stop;
    wait;
  end process;
end;
