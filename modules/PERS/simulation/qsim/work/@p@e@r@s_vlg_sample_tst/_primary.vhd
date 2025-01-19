library verilog;
use verilog.vl_types.all;
entity PERS_vlg_sample_tst is
    port(
        addr            : in     vl_logic_vector(2 downto 0);
        bus_in          : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        ext_in_buttons  : in     vl_logic_vector(15 downto 0);
        ext_in_switches : in     vl_logic_vector(15 downto 0);
        r_en            : in     vl_logic;
        w_en            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PERS_vlg_sample_tst;
