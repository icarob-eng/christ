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
			ir_out, pc_out, pc_a, pc_b, main_bus : in  BIT_VECTOR(15 downto 0);  -- output from IR and PC regs
			exec_en, fetch_en, next_s, next_e    : out bit;  -- HLSM representations
			s, e                                 : in  bit
		);
end ControlUnit;


architecture behav of ControlUnit is

begin

end architecture behav;
