entity CHRIST is 
	port(clk : in bit); -- TODO: PERS
end CHRIST;

architecture behav of CHRIST is
	signal ALU_OPS                                              : BIT_VECTOR(4 downto 0); -- ALU operation
	signal RF_READ_A, RF_READ_B, RF_WRITE, PERS_ADDR            : BIT_VECTOR(2 downto 0); -- RF and pers addressing
	signal ALU_FLAGS, FLAGR_OUT                                 : BIT_VECTOR(2 downto 0); -- Flag input and Flag register output
	signal CACHE_ADDR                                           : BIT_VECTOR(6 downto 0);
	signal MEM_ADDR, MAIN_BUS, ALU_A, ALU_B                     : BIT_VECTOR(15 downto 0); -- IN_BUS: mem->RF, OUT_BUS: RF->mem
	signal CACHE_R, CACHE_W, MEM_R, MEM_W, PERS_R, PERS_W       : bit; -- Read/Write Enable in memories
	signal IR_OUT, PC_OUT, PC_IN, PC_A, PC_B                    : BIT_VECTOR(15 downto 0);
	signal EXEC_EN, FETCH_EN, NEXT_S, NEXT_E, S, E              : bit; -- EXEC and FETCH from HLSM

	component Cache is
		port(
			addr       : in  BIT_VECTOR(6 downto 0);  -- 2^7 addresses
			r_en, w_en : in  bit; -- Read/Write Enable (0 is read)
			input      : in  BIT_VECTOR(15 downto 0);
			output     : out BIT_VECTOR(15 downto 0);
			clk        : in  bit
		);
	end component;

	component Mem is
		port(
			addr       : in  BIT_VECTOR(15 downto 0);  -- 2^16 addresses
			r_en, w_en : in  bit; -- Read/Write Enable (0 is read)
			input      : in  BIT_VECTOR(15 downto 0);
			output     : out BIT_VECTOR(15 downto 0);
			clk        : in  bit
		);
	end component;

	component PERS is  -- periferals module. TODO: add external connections
		port(
			addr       : in  BIT_VECTOR(2 downto 0);  -- 2^3 periferals
			r_en, w_en : in  bit; -- Read/Write Enable (0 is read)
			input      : in  BIT_VECTOR(15 downto 0);
			output     : out BIT_VECTOR(15 downto 0);
			clk        : in  bit
		);
	end component;

	component RF is
		port(
			w_addr, r_a_addr, r_b_addr : in  BIT_VECTOR(2 downto 0);
			input                      : in  BIT_VECTOR(15 downto 0);
			a_out, b_out               : out BIT_VECTOR(15 downto 0);
			clk                        : in  bit
		);
	end component;

	component ALU is
		port(
			a, b  : in  BIT_VECTOR(15 downto 0);
			op    : in  BIT_VECTOR(4 downto 0);
			flags : out BIT_VECTOR(2 downto 0);
			r     : out BIT_VECTOR(15 downto 0)
		);
	end component;

	component ControlUnit is
		port(
			alu_ops                              : out BIT_VECTOR(4 downto 0);
			alu_flags                            : in  BIT_VECTOR(2 downto 0);
			rf_read_a, rf_read_b, rf_write       : out BIT_VECTOR(2 downto 0);
			cache_r, mem_r, pers_r               : out bit;
			cache_w, mem_w, pers_w               : out bit;
			cache_addr                           : out BIT_VECTOR(6 downto 0);
			mem_addr                             : out BIT_VECTOR(15 downto 0);
			pers_addr                            : out BIT_VECTOR(2 downto 0);
			ir_out, pc_out, main_bus             : in  BIT_VECTOR(15 downto 0);  -- output from IR and PC regs
			pc_a, pc_b                           : out BIT_VECTOR(15 downto 0);
			exec_en, fetch_en, next_s, next_e    : out bit;  -- HLSM representations
			s, e                                 : in  bit
		);
	end component;

	component Reg_1b is  -- D flip-flop
		port(
			input, write_en, clk : in  bit;
			output               : out bit
		);
	end component;
	
	component Reg_3b is
		port(
			input    : in  BIT_VECTOR(2 downto 0);
			output   : out BIT_VECTOR(2 downto 0);
			write_en : in  bit;
			clk      : in  bit
		);
	end component;
	
	component Reg_16b is
		port(
			input    : in  BIT_VECTOR(15 downto 0);
			output   : out BIT_VECTOR(15 downto 0);
			write_en : in  bit;
			clk      : in  bit
		);
	end component;
	
	component Adder_16b is
		port(
			a, b : in  BIT_VECTOR(15 downto 0);
			cin  : in  bit;
			s    : out BIT_VECTOR(15 downto 0);
			cout : out bit  -- TODO: consider PC overflow
		);
	end component;
	
begin -- mapping
	-- Control Path
	ControlUnit1 : ControlUnit port map(
			alu_ops => ALU_OPS,
			alu_flags => FLAGR_OUT,
			rf_read_a => RF_READ_A, rf_read_b => RF_READ_B, rf_write => RF_WRITE,
			cache_r => CACHE_R,       mem_r => MEM_R,       pers_r => PERS_R,
			cache_w => CACHE_W,       mem_w => MEM_W,       pers_w => PERS_W,
			cache_addr => CACHE_ADDR, mem_addr => MEM_ADDR, pers_addr => PERS_ADDR,
			ir_out => IR_OUT, pc_out => PC_OUT,
			pc_a => PC_A, pc_b => PC_B, main_bus => MAIN_BUS,
			exec_en => EXEC_EN, fetch_en => FETCH_EN,
			next_s => NEXT_S, next_e => NEXT_E,
			s => S, e => E
		);
		
	e_reg : Reg_1b port map(input => NEXT_E,     output => E,     write_en => clk, clk => clk);
	s_reg : Reg_1b port map(input => NEXT_S,     output => S,     write_en => clk, clk => clk);
	
	IR :    Reg_16b port map(input => MAIN_BUS, output => IR_OUT, write_en => FETCH_EN, clk => clk);
	PC_add : Adder_16b port map(a => PC_A, b => PC_B, cin => '0', s => PC_IN, cout => open);
	PC :    Reg_16b port map(input => PC_IN,    output => PC_OUT, write_en => EXEC_EN,  clk => clk);

	-- Data Path
	Cache1 : Cache port map(addr => CACHE_ADDR, r_en => CACHE_R, w_en => CACHE_W, input => MAIN_BUS, output => MAIN_BUS, clk => clk);
	Mem1   : Mem   port map(addr => MEM_ADDR,   r_en => MEM_R,   w_en => MEM_W,   input => MAIN_BUS, output => MAIN_BUS, clk => clk);
	PERS1  : PERS  port map(addr => PERS_ADDR,  r_en => PERS_R,  w_en => PERS_W,  input => MAIN_BUS, output => MAIN_BUS, clk => clk);

	RF1 : RF port map(w_addr => RF_WRITE, r_a_addr => RF_READ_A, r_b_addr => RF_READ_B, input => MAIN_BUS, a_out => ALU_A, b_out => ALU_B, clk => clk);

	ALU1 : ALU port map(a => ALU_A, b => ALU_B, op => ALU_OPS, flags => ALU_FLAGS, r => MAIN_BUS);
	FLAGR : Reg_3b port map(input => ALU_FLAGS, output => FLAGR_OUT, write_en => EXEC_EN, clk => clk); -- flag register
	
end architecture behav;
