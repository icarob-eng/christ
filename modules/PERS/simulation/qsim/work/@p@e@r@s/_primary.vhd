library verilog;
use verilog.vl_types.all;
entity PERS is
    port(
        addr            : in     vl_logic_vector(2 downto 0);
        r_en            : in     vl_logic;
        w_en            : in     vl_logic;
        bus_in          : in     vl_logic_vector(15 downto 0);
        bus_out         : out    vl_logic_vector(15 downto 0);
        ext_out_leds    : out    vl_logic_vector(15 downto 0);
        ext_out_7seg_3  : out    vl_logic_vector(6 downto 0);
        ext_out_7seg_2  : out    vl_logic_vector(6 downto 0);
        ext_out_7seg_1  : out    vl_logic_vector(6 downto 0);
        ext_out_7seg_0  : out    vl_logic_vector(6 downto 0);
        ext_in_switches : in     vl_logic_vector(15 downto 0);
        ext_in_buttons  : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic
    );
end PERS;
