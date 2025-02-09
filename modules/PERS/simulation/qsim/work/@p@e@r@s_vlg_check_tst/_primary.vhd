library verilog;
use verilog.vl_types.all;
entity PERS_vlg_check_tst is
    port(
        bus_out         : in     vl_logic_vector(15 downto 0);
        ext_out_7seg_0  : in     vl_logic_vector(6 downto 0);
        ext_out_7seg_1  : in     vl_logic_vector(6 downto 0);
        ext_out_7seg_2  : in     vl_logic_vector(6 downto 0);
        ext_out_7seg_3  : in     vl_logic_vector(6 downto 0);
        ext_out_leds    : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end PERS_vlg_check_tst;
