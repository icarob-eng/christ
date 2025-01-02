entity RF is
    port(
        w_addr, r_a_addr, r_b_addr : in BIT_VECTOR(3 downto 1);
        input                                : in BIT_VECTOR(16 downto 1);
        a_out, b_out                         : out BIT_VECTOR(16 downto 1);
        clk                                  : in bit
    );
end RF;

architecture behav of RF is

begin

end architecture behav;
