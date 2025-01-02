library verilog;
use verilog.vl_types.all;
entity ALU_vlg_check_tst is
    port(
        flag            : in     vl_logic_vector(2 downto 0);
        res             : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_vlg_check_tst;
