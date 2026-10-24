library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use std.env.all;
entity aes_tb is end;
architecture test of aes_tb is
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
    file f: text open read_mode is "rom_words.txt";
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

  type glyph_type is array(0 to 511) of std_logic_vector(15 downto 0);
  impure function load_font return glyph_type is
    file f: text open read_mode is "font_words.txt";
    variable l: line;
    variable result: glyph_type;
  begin
    for i in result'range loop readline(f,l); hread(l,result(i)); end loop;
    return result;
  end;
  constant font: glyph_type := load_font;
  signal ram_q, glyph_q, fifo_q: std_logic_vector(15 downto 0) := (others=>'0');
  signal fifo_sel, glyph_sel, fifo_ena, fifo_we: std_logic := '0';
  signal fifo_wd: std_logic_vector(15 downto 0);
  signal scancode_ready: std_logic := '0';
  signal scancode: std_logic_vector(7 downto 0) := (others=>'0');
  signal draw_count: natural := 0;
  signal pop_count: natural := 0;
  signal ram_ena, glyph_ena: std_logic;
  signal cursor_position: natural := 0;
  signal video_test_start, video_test_done: std_logic := '0';
  signal vga_reset: std_logic := '1';
  signal software_sp: natural:=0;
  signal sa: std_logic_vector(15 downto 0);
  signal ga: std_logic_vector(8 downto 0);
  signal sd, gd: std_logic_vector(15 downto 0) := (others=>'0');
  signal se, ge, red, green, blue, hs, vs: std_logic;
  constant heading: string := "FPGA READY";

begin
  clk <= not clk after 5 ns;
  vga_reset <= reset;
  process(clk) begin
    if rising_edge(clk) and WB_block_0_reg_write_enable='1' and WB_block_0_reg_write_adress=x"B" then
      software_sp<=to_integer(unsigned(WB_block_0_reg_write_data));
    end if;
  end process;
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

  fifo_i: entity work.fifo_buffer port map(clk,reset,fifo_wd,fifo_we,fifo_ena,MEM_block_0_bram_address,fifo_q);
  filter_i: entity work.ps2_scancode_filter port map(clk,scancode_ready,scancode,fifo_wd,fifo_we);
  vga_i: entity work.vga_driver port map(clk,vga_reset,sa,se,sd,ga,ge,gd,red,green,blue,hs,vs);

  actual_mux: entity work.fifo_bram_mux port map(
    clk=>clk,addra=>MEM_block_0_bram_address,douta_bram=>ram_q,
    douta_glyph_bram=>glyph_q,douta_fifo=>fifo_q,ena=>MEM_block_0_bram_enable,
    is_load=>MEM_block_0_is_load,douta=>fifo_bram_mux_0_douta,
    ena_bram=>ram_ena,ena_glyph_bram=>glyph_ena,ena_fifo=>fifo_ena);
  process(clk) begin
    if rising_edge(clk) and WB_block_0_reg_write_enable='1' and WB_block_0_reg_write_adress=x"6" then
      cursor_position<=to_integer(unsigned(WB_block_0_reg_write_data));
    end if;
  end process;
  process begin
    wait until rising_edge(clk);
    if fifo_ena='1' and MEM_block_0_bram_address=x"FFFF" then
      wait for 1 ns;
      if fifo_q/=x"0000" then pop_count<=pop_count+1;end if;
    end if;
  end process;


  -- CPU ROM/RAM and VGA RAM use the specified one-edge synchronous reads.
  -- The memories/decode here are behavioral models, not vendor BRAM IP.
  process(clk)
    variable a: natural;
  begin
    if rising_edge(clk) then
      if IF_block_0_ram_enable='1' then
        blk_mem_gen_0_douta <= rom(to_integer(unsigned(IF_block_0_ram_adress)));
      end if;
      fifo_sel <= fifo_ena;
      glyph_sel <= '0';
      if MEM_block_0_bram_enable='1' then
        a := to_integer(unsigned(MEM_block_0_bram_address));
        if a < 16#E000# then
          ram_q <= ram(a);
          if MEM_block_0_bram_write_enable='1' then
            assert a<16#4800# report "Invalid scratch/stack write" severity failure;
            ram(a) <= MEM_block_0_bram_data;
            if MEM_block_0_bram_data(15 downto 8)=x"38" then
              draw_count <= draw_count+1;

            end if;
          end if;
        elsif a <= 16#E1FF# then
          glyph_sel <= '1';
          glyph_q <= font(a-16#E000#);
          assert MEM_block_0_bram_write_enable='0' report "Program rewrites preloaded glyph RAM" severity failure;
        else
          assert a=16#FFFE# or a=16#FFFF# report "Invalid CPU memory access" severity failure;
          assert MEM_block_0_bram_write_enable='0' report "Unexpected FIFO STORE" severity failure;
        end if;
      end if;
      if se='1' then
        assert unsigned(sa)<12288 report "VGA screen address out of range" severity failure;
        sd <= ram(to_integer(unsigned(sa)));
      end if;
      if ge='1' then gd <= font(to_integer(unsigned(ga))); end if;
    end if;
  end process;




  crypto_timing: process(clk)
    variable ticks:natural:=0;
    variable started:natural:=0;
    variable active:boolean:=false;
  begin
    if rising_edge(clk) then
      ticks:=ticks+1;
      if ID_block_0_branch_available='1' then
        if ID_block_0_branch_target=std_logic_vector(to_unsigned(4253,16)) or
           ID_block_0_branch_target=std_logic_vector(to_unsigned(4346,16)) then
          started:=ticks;active:=true;
        elsif ID_block_0_branch_target=std_logic_vector(to_unsigned(5481,16)) and active then
          report "AES routine to display return: " & integer'image(ticks-started) & " cycles at 100 MHz";
          active:=false;
        end if;
      end if;
    end if;
  end process;

  stimulus: process
    type nlist is array(natural range <>) of natural;
    constant digits:nlist:=(16#45#,16#16#,16#1E#,16#26#,16#25#,16#2E#,16#36#,16#3D#,16#3E#,16#46#);
    procedure scan(value:natural) is begin
      wait until falling_edge(clk);scancode<=std_logic_vector(to_unsigned(value,8));scancode_ready<='1';
      wait until falling_edge(clk);scancode_ready<='0';
    end;
    procedure ready is begin
      wait until rising_edge(clk) and fifo_ena='1' and MEM_block_0_bram_address=x"FFFF" for 12 ms;
      assert fifo_ena='1' report "CPU did not reach keyboard poll" severity failure;
      wait for 1 ns;
      assert software_sp=16#3F00# report "Unbalanced software call stack" severity failure;
    end;
    procedure press(raw:natural) is
      variable before:natural;
    begin
      before:=pop_count;scan(raw);
      wait until pop_count=before+1 for 12 ms;
      assert pop_count=before+1 report "Key not consumed" severity failure;
      ready;
      scan(16#F0#);scan(raw);
    end;
    procedure memory(address,value:natural) is begin
      assert ram(address)=std_logic_vector(to_unsigned(value,16)) report "Wrong RAM " & integer'image(address) &
        " got " & to_hstring(ram(address)) & " expected " & integer'image(value) severity failure;
    end;
    procedure big(row,col:natural;message:string;rgb:natural) is
      variable code,bit_index,word_index:natural;
      variable wanted:std_logic_vector(15 downto 0);
    begin
      for i in message'range loop
        code:=character'pos(message(i));
        for y in 0 to 4 loop
          if y<3 then word_index:=code*2;bit_index:=(2-y)*5;else word_index:=code*2+1;bit_index:=(4-y)*5;end if;
          for x in 0 to 4 loop
            wanted:=x"0000";
            if font(word_index)(bit_index+4-x)='1' then wanted:=std_logic_vector(to_unsigned(rgb*16#900#,16));end if;
            assert ram((row+y)*128+col+(i-message'low)*6+x)=wanted
              report "Large text mismatch: " & message & " char " & integer'image(i) &
              " x " & integer'image(x) & " y " & integer'image(y) severity failure;
          end loop;
        end loop;
      end loop;
    end;
    procedure dump(filename:string) is
      file f:text open write_mode is filename;
      variable l:line;
    begin
      for i in 0 to 12287 loop hwrite(l,ram(i));writeline(f,l);end loop;
    end;

    constant hex_scans:nlist:=(16#45#,16#16#,16#1E#,16#26#,16#25#,16#2E#,16#36#,16#3D#,
                              16#3E#,16#46#,16#1C#,16#32#,16#21#,16#23#,16#24#,16#2B#);
    procedure hex_keys(message:string) is
      variable nibble:natural;
    begin
      for i in message'range loop
        if message(i)>='0' and message(i)<='9' then nibble:=character'pos(message(i))-character'pos('0');
        else nibble:=character'pos(message(i))-character'pos('A')+10;end if;
        press(hex_scans(nibble));
      end loop;
    end;
    procedure bytes_at(address:natural;message:string) is
      variable byte:std_logic_vector(7 downto 0);
      variable l:line;
    begin
      for i in 0 to 15 loop
        l:=new string'(message(message'low+i*2 to message'low+i*2+1));hread(l,byte);deallocate(l);
        memory(address+i,to_integer(unsigned(byte)));
      end loop;
    end;
    procedure output_hex(message:string) is begin
      big(70,8,message(message'low to message'low+15),2);
      big(77,8,message(message'low+16 to message'high),2);
    end;
    constant key1:string:="000102030405060708090A0B0C0D0E0F";
    constant plain1:string:="00112233445566778899AABBCCDDEEFF";
    constant cipher1:string:="69C4E0D86A7B0430D8CDB78070B4C55A";
    constant key2:string:="2B7E151628AED2A6ABF7158809CF4F3C";
    constant plain2:string:="6BC1BEE22E409F96E93D7E117393172A";
    constant cipher2:string:="3AD77BB40D7A3660A89ECAF32466EF97";
    file expected_tables:text open read_mode is "tables_expected.txt";
    variable l:line;
    variable address,value:std_logic_vector(15 downto 0);
  begin
    ready;big(3,8,"AES 128",3);big(85,8,"SELECT MODE",3);
    while not endfile(expected_tables) loop
      readline(expected_tables,l);hread(l,address);hread(l,value);
      memory(to_integer(unsigned(address)),to_integer(unsigned(value)));
    end loop;
    press(16#2C#);memory(16#3001#,3);bytes_at(16#3100#,key1);bytes_at(16#3120#,plain1);bytes_at(16#3400#,cipher1);
    bytes_at(16#35A0#,"13111D7FE3944A17F307A78B4D2B30C5");output_hex(cipher1);big(85,8,"ENCRYPTED",2);
    dump("aes_encrypt_preview.txt");
    report "PASS: exact delivery ROM, standard AES-128 encryption vector and displayed ciphertext";
    press(16#23#);bytes_at(16#3120#,cipher1);bytes_at(16#3400#,plain1);output_hex(plain1);big(85,8,"DECRYPTED",2);
    dump("aes_decrypt_preview.txt");
    press(16#24#);bytes_at(16#3400#,cipher1);output_hex(cipher1);
    press(16#2D#);memory(16#3001#,0);press(16#23#);press(16#2C#);
    bytes_at(16#3120#,cipher1);bytes_at(16#3400#,plain1);output_hex(plain1);
    report "PASS: direct decryption and E/D output chaining";
    press(16#2D#);press(16#24#);press(16#5A#);memory(16#3001#,1);memory(16#3002#,0);
    hex_keys("2B");press(16#66#);memory(16#3002#,1);
    hex_keys(key2(2 to 32));memory(16#3002#,32);hex_keys("F");memory(16#3002#,32);
    press(16#5A#);memory(16#3001#,2);bytes_at(16#3100#,key2);
    hex_keys(plain2(1 to 16));press(16#5A#);memory(16#3001#,2);memory(16#3002#,16);
    hex_keys(plain2(17 to 32));press(16#5A#);memory(16#3001#,3);
    bytes_at(16#3120#,plain2);bytes_at(16#3400#,cipher2);output_hex(cipher2);
    press(16#23#);bytes_at(16#3400#,plain2);output_hex(plain2);
    press(16#5A#);memory(16#3001#,0);big(85,8,"SELECT MODE",3);
    report "PASS: manual key/data entry, backspace, incomplete/extra digit handling, second standard vector, decryption, restart and balanced software calls";
    report "OVERALL PASS: AES-128 keyboard/VGA program on saved full CPU pipeline";
    stop;wait;
  end process;
end;
