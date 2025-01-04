entity ControlUnit is
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
end ControlUnit;

architecture behav of ControlUnit is
	signal ZERO                : BIT_VECTOR(15 downto 0) := "0000000000000000";
	signal I                   : BIT_VECTOR(5 downto 0);
	signal A, B, C             : BIT_VECTOR(2 downto 0);
	signal D                   : bit;
	signal I_Ctl, I_Dat, I_ALU : bit; -- flags the type of instruction
	
	function to_bit(input: boolean) return bit is
	begin
		if input then
			return '1';
		end if;
	return '0';	end function;
	
	component Mux2x1_3b is
		port(
			i0, i1 : in  BIT_VECTOR(2 downto 0);
			s      : in  bit;
			o      : out BIT_VECTOR(2 downto 0)
		);
	end component;
		
	component Mux2x1_5b is
		port(
			i0, i1 : in  BIT_VECTOR(4 downto 0);
			s      : in  bit;
			o      : out BIT_VECTOR(4 downto 0)
		);
	end component;
	
	component Mux4x1_3b is
		port(
			i00, i01, i10, i11 : in  BIT_VECTOR(2 downto 0);
			s0, s1             : in  bit;
			o                  : out BIT_VECTOR(2 downto 0)
		);
	end component;
	
	component Mux4x1_16b is
		port(
			i00, i01, i10, i11 : in  BIT_VECTOR(15 downto 0);
			s0, s1             : in  bit;
			o                  : out BIT_VECTOR(15 downto 0)
		);
	end component;

begin
	-- breakup of Word
	I <= ir_out(15 downto 10);  -- instruction
	A <= ir_out(9 downto 7);
	B <= ir_out(6 downto 4);
	C <= ir_out(3 downto 1);
	D <= ir_out(0);
	
	---- s == 0 -> FETCH
	fetch_en <= not s;
	mem_r    <= not s; -- provisory: memory only for reading code to IR
	mem_w    <= '0';
	mem_addr <= pc_out;  -- provisory (will not read without mem_r)
	
	---- s == 1 -> EXECUTE
	exec_en <= s;  -- eq to PC write
	I_Ctl   <= s and (not I(5) and not I(4)); -- I == 00xxxx -> Ctrl
	I_Dat   <= s and not I(5) and I(4);     -- I == 01xxxx -> Dat
	I_ALU   <= s and I(5);                   -- I == 1xxxxx -> ALU
	
	ALU_ops_MUX : Mux2x1_5b port map(
		i0 => ZERO(4 downto 0),
		i1 =>    I(4 downto 0),
		s  => I_ALU,
		o  => alu_ops
	);
	
	pc_a <= pc_out; -- provisory
	pc_b_MUX : Mux4x1_16b port map(
		i00 => ZERO,                               -- stop PC (HALT, 000000)
		i01 => ZERO(15 downto 1) & "1",            -- increments PC
		i10 => ZERO(15 downto 10) & A & B & C & D, -- adds arguments to PC (JMPRD,  000001)
		i11 => ZERO(15 downto 7) &      B & C & D, -- adds arguments to PC (JMPRDC, 000101)
		s0  => not (to_bit(I = "000000") or to_bit(I = "000001")),
		s1  => to_bit(I = "000001") or to_bit(I = "000101"), -- JUMP operations
		o   => pc_b
	);
	
	rf_a_MUX : Mux2x1_3b port map(
		i0 => ZERO(2 downto 0),
		i1 => A,
		s  => I_ALU or (I_Dat and not I(2)),  -- ALU or read from reg operation
		o  => rf_read_a
	);
	rf_b_MUX : Mux2x1_3b port map(
		i0 => ZERO(2 downto 0),
		i1 => B,
		s  => I_ALU,
		o  => rf_read_b
	);
	rf_w_MUX : Mux4x1_3b port map(
		i00 => ZERO(2 downto 0),
		i01 => A,
		i10 => B,
		i11 => C,
		s0  => I_ALU or (I_Dat and not I(2)),     -- results in (0,B) for all cases except writing in reg and ALU
		s1  => I_ALU or (to_bit(I = "010100") and not s), -- results in (0,A) for all cases except R2R and ALU
		o   => rf_write
	);
	
	cache_r <= not s and to_bit(I = "010011");
	cache_w <= not s and to_bit(I = "010111");
	cache_addr <= B & C & D;
	
	pers_r <= not s and to_bit(I = "010001");
	pers_w <= not s and to_bit(I = "010101");
	pers_addr <= B;
	
	---- Next states:
	next_e <= '0';  -- add EXECUTE extender conditions here
	next_s <= not s or e;

end architecture behav;
