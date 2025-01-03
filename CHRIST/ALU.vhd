entity ALU is
    port(
        a, b  : in BIT_VECTOR(15 downto 0);
        op    : in BIT_VECTOR(4 downto 0);
        flags : out BIT_VECTOR(2 downto 0);
        r     : out BIT_VECTOR(15 downto 0)
    );
end ALU;

architecture behav of ALU is

begin

end architecture behav;
