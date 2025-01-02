entity ControlUnit is
    port(
        alu_ops                        : out BIT_VECTOR(5 downto 1);
        alu_flags                      : in BIT_VECTOR(3 downto 1);
        rf_read_a, rf_read_b, rf_write : out BIT_VECTOR(3 downto 1);
        cache_r, mem_r, pers_r         : out bit;
        cache_w, mem_w, pers_w         : out bit;
        cache_addr                     : out BIT_VECTOR(7 downto 1);
        mem_addr                       : out BIT_VECTOR(16 downto 1);
        pers_addr                      : out BIT_VECTOR(3 downto 1);
        ir_out, pc_out                 : in BIT_VECTOR(16 downto 1);  -- output from IR and PC regs
        pc_overwrite                   : out BIT_VECTOR(16 downto 1);
        exec_en, fetch_en              : out bit;
        no_up, mux_bus_ctrl            : out bit
    );
end ControlUnit;


architecture behav of ControlUnit is

begin

end architecture behav;
