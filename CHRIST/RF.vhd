entity RF is
    port(
        w_addr, r_a_addr, r_b_addr : in BIT_VECTOR(2 downto 0);
        input                                : in BIT_VECTOR(15 downto 0);
        a_out, b_out                         : out BIT_VECTOR(15 downto 0);
        clk                                  : in bit
    );
end RF;

architecture behav of RF is

begin

end architecture behav;
