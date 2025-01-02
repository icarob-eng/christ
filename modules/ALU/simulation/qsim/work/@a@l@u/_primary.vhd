library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        ops_alu         : in     vl_logic_vector(3 downto 0);
        reg_a           : in     vl_logic_vector(15 downto 0);
        reg_b           : in     vl_logic_vector(15 downto 0);
        res             : out    vl_logic_vector(15 downto 0);
        flag            : out    vl_logic_vector(2 downto 0)
    );
end ALU;
