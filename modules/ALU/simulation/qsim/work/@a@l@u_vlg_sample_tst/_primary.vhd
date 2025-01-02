library verilog;
use verilog.vl_types.all;
entity ALU_vlg_sample_tst is
    port(
        ops_alu         : in     vl_logic_vector(3 downto 0);
        reg_a           : in     vl_logic_vector(15 downto 0);
        reg_b           : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_vlg_sample_tst;
