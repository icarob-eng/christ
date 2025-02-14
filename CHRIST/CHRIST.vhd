library ieee;
use ieee.std_logic_1164.all;

entity CHRIST is 
	port(
		clk             : in std_logic;
		ext_out_leds    : out std_logic_vector(15 downto 0);
		ext_out_7seg_3  : out std_logic_vector(6 downto 0);
		ext_out_7seg_2  : out std_logic_vector(6 downto 0);
		ext_out_7seg_1  : out std_logic_vector(6 downto 0);
		ext_out_7seg_0  : out std_logic_vector(6 downto 0);
		ext_in_switches : in std_logic_vector(15 downto 0);
		ext_in_buttons  : in std_logic_vector(15 downto 0)
	);
end CHRIST;

architecture behav of CHRIST is
	signal ALU_OPS                                   : std_logic_vector(4 downto 0); -- ALU operation
	signal RF_READ_A, RF_READ_B, RF_WRITE, PERS_ADDR : std_logic_vector(2 downto 0); -- RF and pers addressing
	signal ALU_FLAGS, FLAGR_OUT                      : std_logic_vector(2 downto 0); -- Flag input and Flag register output
	signal CACHE_ADDR                                : std_logic_vector(6 downto 0);
	signal MEM_ADDR, MAIN_BUS, ALU_A, ALU_B          : std_logic_vector(15 downto 0);
	signal ALU_OUT, PERS_OUT, MEM_OUT, CACHE_OUT     : std_logic_vector(15 downto 0);
	signal MUX_CTRL                                  : std_logic_vector(1 downto 0);
	signal CACHE_W, MEM_W, PERS_W                    : std_logic; -- Write Enable in memories (read redundant due to mux)
	signal IR_OUT, PC_OUT, PC_IN, PC_A, PC_B         : std_logic_vector(15 downto 0);
	signal EXEC_EN, FETCH_EN, NEXT_S, NEXT_E, S, E   : std_logic; -- EXEC and FETCH from HLSM

	component Cache is
		port(
			addr   : in  std_logic_vector(6 downto 0);  -- 2^7 addresses
			w_en   : in  std_logic; -- Write Enable
			input  : in  std_logic_vector(15 downto 0);
			output : out std_logic_vector(15 downto 0);
			clk    : in  std_logic
		);
	end component;

	component Mem is
		port(
			addr   : in  std_logic_vector(15 downto 0);  -- 2^16 addresses
			w_en   : in  std_logic; -- Write Enable
			input  : in  std_logic_vector(15 downto 0);
			output : out std_logic_vector(15 downto 0);
			clk    : in  std_logic
		);
	end component;

	component PERS is  -- periferals module
		 port(
			  addr            : in std_logic_vector(2 downto 0);  -- 2^3 periferals
			  w_en            : in std_logic; -- Write Enable
			  bus_in          : in std_logic_vector(15 downto 0);
			  bus_out         : out std_logic_vector(15 downto 0);
			  
			  ext_out_leds    : out std_logic_vector(15 downto 0);
			  
			  ext_out_7seg_3  : out std_logic_vector(6 downto 0);
			  ext_out_7seg_2  : out std_logic_vector(6 downto 0);
			  ext_out_7seg_1  : out std_logic_vector(6 downto 0);
			  ext_out_7seg_0  : out std_logic_vector(6 downto 0);
			  
			  ext_in_switches : in std_logic_vector(15 downto 0);
			  ext_in_buttons  : in std_logic_vector(15 downto 0);
			  
			  clk        : in std_logic
		 );
	end component;

	component RF is
		port(
			w_addr, r_a_addr, r_b_addr : in  std_logic_vector(2 downto 0);
			input                      : in  std_logic_vector(15 downto 0);
			a_out, b_out               : out std_logic_vector(15 downto 0);
			clk                        : in  std_logic
		);
	end component;

	component ALU is
		port(
			a, b  : in  std_logic_vector(15 downto 0);
			op    : in  std_logic_vector(4 downto 0);
			flags : out std_logic_vector(2 downto 0);
			r     : out std_logic_vector(15 downto 0)
		);
	end component;

	component ControlUnit is
		port(
			alu_ops                              : out std_logic_vector(4 downto 0);
			alu_flags                            : in  std_logic_vector(2 downto 0);
			rf_read_a, rf_read_b, rf_write       : out std_logic_vector(2 downto 0);
			cache_w, mem_w, pers_w               : out std_logic;
			cache_addr                           : out std_logic_vector(6 downto 0);
			mem_addr                             : out std_logic_vector(15 downto 0);
			pers_addr                            : out std_logic_vector(2 downto 0);
			ir_out, pc_out, main_bus             : in  std_logic_vector(15 downto 0);  -- output from IR and PC regs
			pc_a, pc_b                           : out std_logic_vector(15 downto 0);
			mux_ctrl                             : out std_logic_vector(1 downto 0);
			exec_en, fetch_en, next_s, next_e    : out std_logic;  -- HLSM representations
			s, e                                 : in  std_logic
		);
	end component;

	component Reg_1b is  -- D flip-flop
		port(
			input, write_en, clk : in  std_logic;
			output               : out std_logic
		);
	end component;
	
	component Reg_3b is
		port(
			input    : in  std_logic_vector(2 downto 0);
			output   : out std_logic_vector(2 downto 0);
			write_en : in  std_logic;
			clk      : in  std_logic
		);
	end component;
	
	component Reg_16b is
		port(
			input    : in  std_logic_vector(15 downto 0);
			output   : out std_logic_vector(15 downto 0);
			write_en : in  std_logic;
			clk      : in  std_logic
		);
	end component;
	
	component Adder_16b is
		port(
			a, b : in  std_logic_vector(15 downto 0);
			cin  : in  std_logic;
			s    : out std_logic_vector(15 downto 0);
			cout : out std_logic
		);
	end component;

	component Mux4x1_16b is
    port(
        i00, i01, i10, i11 : in  std_logic_vector(15 downto 0);
        s0, s1             : in  std_logic;
        o                  : out std_logic_vector(15 downto 0)
    );
	end component;
	
begin -- mapping

	-- Control Path
	ControlUnit1 : ControlUnit port map(
			alu_ops => ALU_OPS,
			alu_flags => FLAGR_OUT,
			rf_read_a => RF_READ_A, rf_read_b => RF_READ_B, rf_write => RF_WRITE,
			cache_w => CACHE_W,       mem_w => MEM_W,       pers_w => PERS_W,
			cache_addr => CACHE_ADDR, mem_addr => MEM_ADDR, pers_addr => PERS_ADDR,
			ir_out => IR_OUT, pc_out => PC_OUT,
			pc_a => PC_A, pc_b => PC_B, main_bus => MAIN_BUS,
			mux_ctrl => MUX_CTRL,
			exec_en => EXEC_EN, fetch_en => FETCH_EN,
			next_s => NEXT_S, next_e => NEXT_E,
			s => S, e => E
		);

	e_reg  : Reg_1b port map(input => NEXT_E,     output => E,     write_en => '1', clk => clk);
	s_reg  : Reg_1b port map(input => NEXT_S,     output => S,     write_en => '1', clk => clk);
	
	IR     : Reg_16b port map(input => MAIN_BUS, output => IR_OUT, write_en => FETCH_EN, clk => clk);
	PC_add : Adder_16b port map(a => PC_A, b => PC_B, cin => '0', s => PC_IN, cout => open);
	PC     : Reg_16b port map(input => PC_IN,    output => PC_OUT, write_en => EXEC_EN,  clk => clk);

	-- Data Path
	Cache1 : Cache port map(addr => CACHE_ADDR, w_en => CACHE_W, input => MAIN_BUS, output => CACHE_OUT, clk => clk);
	Mem1   : Mem   port map(addr => MEM_ADDR,   w_en => MEM_W,   input => MAIN_BUS, output => MEM_OUT, clk => clk);
	
	PERS1 : PERS port map(
		addr => PERS_ADDR,
		w_en => PERS_W,
		bus_in => MAIN_BUS,
		bus_out => PERS_OUT,
		ext_out_leds => ext_out_leds,
		ext_out_7seg_3 => ext_out_7seg_3,
		ext_out_7seg_2 => ext_out_7seg_2,
		ext_out_7seg_1 => ext_out_7seg_1,
		ext_out_7seg_0 => ext_out_7seg_0,
		ext_in_switches => ext_in_switches,
		ext_in_buttons => ext_in_buttons,
		clk => clk
	);

	Mux : Mux4x1_16b port map(
		i00 => ALU_OUT,
		i01 => PERS_OUT,
		i10 => MEM_OUT,
		i11 => CACHE_OUT,
		s0 => MUX_CTRL(0), s1 => MUX_CTRL(1),
		o => MAIN_BUS
	);

	RF1 : RF port map(w_addr => RF_WRITE, r_a_addr => RF_READ_A, r_b_addr => RF_READ_B, input => MAIN_BUS, a_out => ALU_A, b_out => ALU_B, clk => clk);

	ALU1 : ALU port map(a => ALU_A, b => ALU_B, op => ALU_OPS, flags => ALU_FLAGS, r => ALU_OUT);
	FLAGR : Reg_3b port map(input => ALU_FLAGS, output => FLAGR_OUT, write_en => EXEC_EN, clk => clk); -- flag register
end architecture behav;
