entity Mux2x1_16b is -- 2 inputs and 16 bits
    port(
        a, b : in BIT_VECTOR(16 downto 1);
        s    : in bit;
        o    : out BIT_VECTOR(16 downto 1)
    );
end Mux2x1_16b;

architecture behav of Mux2x1_16b is

begin

end architecture behav;