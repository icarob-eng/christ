library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        op              : in     vl_logic_vector(4 downto 0);
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        r               : out    vl_logic_vector(15 downto 0);
        flags           : out    vl_logic_vector(2 downto 0)
    );
end ALU;
