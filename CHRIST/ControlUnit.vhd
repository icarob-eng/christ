library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		alu_ops                           : out std_logic_vector(4 downto 0);
		alu_flags                         : in  std_logic_vector(2 downto 0);
		rf_read_a, rf_read_b, rf_write    : out std_logic_vector(2 downto 0);
		cache_w, mem_w, pers_w            : out std_logic;
		cache_addr                        : out std_logic_vector(6 downto 0);
		mem_addr                          : out std_logic_vector(15 downto 0);
		pers_addr                         : out std_logic_vector(2 downto 0);
		ir_out, pc_out, main_bus          : in  std_logic_vector(15 downto 0);  -- output from IR and PC regs
		pc_a, pc_b                        : out std_logic_vector(15 downto 0);
		mux_ctrl                          : out std_logic_vector(1 downto 0);
		exec_en, fetch_en, next_s, next_e : out std_logic;  -- HLSM representations
		s, e                              : in  std_logic
		);
end ControlUnit;

architecture behav of ControlUnit is
	signal ZERO    : std_logic_vector(15 downto 0) := "0000000000000000";
	signal ONE     : std_logic_vector(15 downto 0) := "1111111111111111";
	signal I       : std_logic_vector(5 downto 0);
	signal A, B, C : std_logic_vector(2 downto 0);
	signal D       : std_logic;

	signal
	type mux_selector is (ALU, PERS, MEM, CACHE);
begin
	-- internal singals
	-- breakup of Word
	I <= ir_out(15 downto 10);  -- instruction
	A <= ir_out(9 downto 7);
	B <= ir_out(6 downto 4);
	C <= ir_out(3 downto 1);
	D <= ir_out(0);

	instruction_proc: process(s, e) is
	variable mux_input : mux_selector := ALU;
	variable PC_APPEND : std_logic_vector := ZERO;
	begin
		-- outputs with side effects (to overwrite)
		rf_write <= "000";
		cache_w  <= '0';
		mem_w    <= '0';
		pers_w   <= '0';

		if s='0' and not e='0' then  -- s == 1 and e == 0 -> EXECUTE
			-- HLSM transition
			-- TODO: use e
			fetch_en <= '0';
			exec_en  <= '1';
			next_e <= '0';
			next_s <= '0';

			-- PC <- PC + 1 (to overwrite)
			pc_a <= pc_out;
			pc_b <= ZERO(15 downto 1) & "1";

			-- conventions (to overwrite)
			rf_read_b <= "000";  -- TODO: check if alu ops make this obsolete
			rf_read_a <= A;
			alu_ops <= ZERO(4 downto 0);

			-- optmizations for ALU ops
			if I(5)='1' then
				alu_ops <= I(4 downto 0);
				rf_write <= A;
			end if;

			case I is
				when "000000" =>  -- HALT
					-- PC <- PC + 0
					pc_b <= ZERO;
				when "000001" =>  -- JMPRD
					-- PC <- PC + ABCD
					-- appends one if increment is negative
					PC_APPEND <= ONE when A(2) else ZERO;
					pc_b <= PC_APPEND(5 downto 0)&A&B&C&D;
				when "000101" =>  -- JMPRDC
					if alu_flags = A then
						-- PC <- PC + BCD
						PC_APPEND <= ONE when B(2) else ZERO;
						pc_b <= PC_APPEND(8 downto 0)&B&C&D;
					end if;
				when "001100" =>  -- NOPE
					-- No operation...
				when "010001" =>  -- P2R
					-- R[A] <- P[B]
					mux_input := PERS;
					pers_addr <= B;
					rf_write <= A;
				when "010011" =>  -- C2R
					-- R[A] <- Cache[BCD]
					mux_input := CACHE;
					cache_addr <= B&C&D;
					rf_write <= A;
				when "010100" =>  -- R2R
					-- R[B] <- R[A]
					rf_write <= B;
				when "010101" =>  -- R2P
					-- P[B] <- R[A]
					pers_w <= '1';
					pers_addr <= B;
				when "010111" =>  -- R2C
					-- Cache[BCD] <- R[A]
					cache_w <= '1';
					cache_addr <= B&C&D;
				when "100000" =>  -- NULL
					-- R[A] <- R[A] + 0
				when "100001" =>  -- ADD
					-- R[A] <- R[B] + R[C]
					rf_read_a <= B;
					rf_read_b <= C;
				when "100010" =>  -- SUB
					-- R[A] <- R[B] - R[C]
					rf_read_a <= B;
					rf_read_b <= C;
				when "100011" =>  -- INC
					-- R[A] <- R[A] + 1
				when "100100" =>  -- DEC
					-- R[A] <- R[A] - 1
				when "100101" =>  -- AND
					-- R[A] <- R[B] & R[C]
					rf_read_a <= B;
					rf_read_b <= C;
				when "100110" =>  -- OR
					-- R[A] <- R[B] | R[C]
					rf_read_a <= B;
					rf_read_b <= C;
				when "100111" =>  -- XOR
					-- R[A] <- R[B] xor R[C]
					rf_read_a <= B;
					rf_read_b <= C;
				when "101000" =>  -- NOT
					-- R[A] <- not(R[A])
				when others =>    -- INVALID: HALT
					-- PC <- PC + 0
					pc_b <= ZERO;
			end case;

		elsif s='1' and e='1' then   -- s == 1 and e == 1 -> EXECUTE EXTENDED
			-- HLSM transition
			fetch_en <= '0';
			exec_en  <= '1';
			next_e <= '0';
			next_s <= '0';

		else                            -- s == 0 -> FETCH
			-- HLSM transition
			fetch_en <= '1';
			exec_en  <= '0';
			next_e <= '0';
			next_s <= '1';

			-- IR <- MEM[PC]
			mem_w <= '0';
			mem_addr <= pc_out;
			mux_input := MEM;
		end if;

		case mux_input is
			when ALU   => mux_ctrl <= "00";
			when PERS  => mux_ctrl <= "01";
			when MEM   => mux_ctrl <= "10";
			when CACHE => mux_ctrl <= "11";
		end case;
	end process;

end architecture behav;
