entity Mux2x1_16b is -- 2 inputs and 16 bits
    port(
        a, b : in BIT_VECTOR(15 downto 0);
        s    : in bit;
        o    : out BIT_VECTOR(15 downto 0)
    );
end Mux2x1_16b;

architecture behav of Mux2x1_16b is

begin

end architecture behav;
