entity CHRIST is 
	port(clk : in bit); -- TODO: PERS
end CHRIST;

architecture behav of CHRIST is
	signal ALU_OPS                                              : BIT_VECTOR(5 downto 0); -- ALU operation
	signal ALU_FLAGS, RF_READ_A, RF_READ_B, RF_WRITE, PERS_ADDR : BIT_VECTOR(3 downto 0); -- flags output, RF addressing
	signal CACHE_ADDR                                           : BIT_VECTOR(7 downto 0);
	signal MEM_ADDR, IN_BUS, OUT_BUS, MUXED_BUS, ALU_A, ALU_B   : BIT_VECTOR(16 downto 0); -- IN_BUS: mem->RF, OUT_BUS: RF->mem
	signal CACHE_R, CACHE_W, MEM_R, MEM_W, PERS_R, PERS_W       : bit; -- Read/Write Enable in memories
	signal IR_OUT, PC_OUT, PC_OVERWRITE, PC_INCREMENT, PC_MUX   : BIT_VECTOR(16 downto 0);
	signal EXEC_EN, FETCH_EN, NO_UP, MUX_BUS_CTRL               : bit; -- EXEC, FETCH in FSM and NO_UP flag

	component Cache is
		port(
			addr       : in BIT_VECTOR(7 downto 0);  -- 2^7 addresses
			r_en, w_en : in bit; -- Read/Write Enable (0 is read)
			input      : in BIT_VECTOR(16 downto 0);
			output     : out BIT_VECTOR(16 downto 0);
			clk        : in bit
		);
	end component;

	component Mem is
		port(
			addr       : in BIT_VECTOR(16 downto 0);  -- 2^16 addresses
			r_en, w_en : in bit; -- Read/Write Enable (0 is read)
			input      : in BIT_VECTOR(16 downto 0);
			output     : out BIT_VECTOR(16 downto 0);
			clk        : in bit
		);
	end component;

	component PERS is  -- periferals module. TODO: add external connections
		port(
			addr       : in BIT_VECTOR(3 downto 0);  -- 2^3 periferals
			r_en, w_en : in bit; -- Read/Write Enable (0 is read)
			input      : in BIT_VECTOR(16 downto 0);
			output     : out BIT_VECTOR(16 downto 0);
			clk        : in bit
		);
	end component;

	component RF is
		port(
			w_addr, r_a_addr, r_b_addr : in BIT_VECTOR(3 downto 0);
			input                                : in BIT_VECTOR(16 downto 0);
			a_out, b_out                         : out BIT_VECTOR(16 downto 0);
			clk                                  : in bit
		);
	end component;

	component ALU is
		port(
			a, b  : in BIT_VECTOR(16 downto 0);
			op    : in BIT_VECTOR(5 downto 0);
			flags : out BIT_VECTOR(3 downto 0);
			r     : out BIT_VECTOR(16 downto 0)
		);
	end component;

	component ControlUnit is
		port(
			alu_ops                        : out BIT_VECTOR(5 downto 0);
			alu_flags                      : in BIT_VECTOR(3 downto 0);
			rf_read_a, rf_read_b, rf_write : out BIT_VECTOR(3 downto 0);
			cache_r, mem_r, pers_r         : out bit;
			cache_w, mem_w, pers_w         : out bit;
			cache_addr                     : out BIT_VECTOR(7 downto 0);
			mem_addr                       : out BIT_VECTOR(16 downto 0);
			pers_addr                      : out BIT_VECTOR(3 downto 0);
			ir_out, pc_out                 : in BIT_VECTOR(16 downto 0);  -- output from IR and PC regs
			pc_overwrite                   : out BIT_VECTOR(16 downto 0);
			exec_en, fetch_en              : out bit;
			no_up, mux_bus_ctrl            : out bit
		);
	end component;
	
	component Reg_16b is
		port(
			input    : in BIT_VECTOR(16 downto 0);
			output   : out BIT_VECTOR(16 downto 0);
			write_en : in bit;
			clk      : in bit
		);
	end component;
	
	component Mux2x1_16b -- 2 inputs and 16 bits
		port(
			a, b : in BIT_VECTOR(16 downto 0);
			s    : in bit;
			o    : out BIT_VECTOR(16 downto 0);
		);
	end component;
	
	component Adder_16b is
		port(
			a, b : in BIT_VECTOR(16 downto 0);
			cin  : in bit;
			s    : out BIT_VECTOR(16 downto 0);
			cout : out bit;  -- TODO: consider PC overflow
		);
	end component;
	
begin -- mapping
	-- Control Path
	ControlUnit_ : ControlUnit port map(
			alu_ops => ALU_OPS,
			alu_flags => ALU_FLAGS,
			rf_read_a => RF_READ_A, rf_read_b => RF_READ_B, rf_write => RF_WRITE,
			cache_r => CACHE_R,       mem_r => MEM_R,       pers_r => PERS_R,
			cache_w => CACHE_W,       mem_w => MEM_W,       pers_w => PERS_W,
			cache_addr => CACHE_ADDR, mem_addr => MEM_ADDR, pers_addr => PERS_ADDR,
			ir_out => IR_OUT, pc_out => PC_OUT,
			pc_overwrite => PC_OVERWRITE,
			exec_en => EXEC_EN, fetch_en => FETCH_EN, no_up => NO_UP, mux_bus_ctrl => MUX_BUS_CTRL
		);

	IR : Reg_16b port map(input => OUT_BUS, output => IR_OUT, write_en => FETCH_EN, clk => clk);
	Incrementer : Adder_16b port map(a => PC_OUT, b => "0000000000000000", cin => 1, s => PC_INCREMENT, cout => open);
	PCMux : Mux2x1_16b port map(a => PC_INCREMENT, b => PC_OVERWRITE, s => NO_UP, o => PC_MUX);  -- returns b if s is true
	PC : Reg_16b port map(input => PC_MUX, output => PC_OUT, write_en => EXEC_EN, clk => clk);

	-- Data Path
	Cache_ : Cache port map(addr => CACHE_ADDR, r_en => CACHE_R, input => OUT_BUS, output => IN_BUS, clk => clk);
	Mem_   : Mem   port map(addr => MEM_ADDR,   r_en => MEM_R,   input => OUT_BUS, output => IN_BUS, clk => clk);
	PERS_  : PERS  port map(addr => PERS_ADDR,  r_en => PERS_R,  input => OUT_BUS, output => IN_BUS, clk => clk);

	in_bus_mux : Mux2x1_16b port map(a => IN_BUS, b => OUT_BUS, s => MUX_BUS_CTRL, o => MUXED_BUS);  -- returns b if s is true

	RF_ : RF port map(w_addr => RF_WRITE, r_a_addr => RF_READ_A, r_b_addr => RF_READ_B, input => MUXED_BUS, a_out => ALU_A, b_out => ALU_B, clk => clk);

	ALU_ : ALU port map(a => ALU_A, b => ALU_B, op => ALU_OPS, flags => ALU_FLAGS, r => OUT_BUS);
end architecture behav;
