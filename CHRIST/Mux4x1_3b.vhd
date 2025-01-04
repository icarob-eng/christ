entity Mux4x1_3b is
    port(
        i00, i01, i10, i11 : in  BIT_VECTOR(2 downto 0);
        s0, s1             : in  bit;
        o                  : out BIT_VECTOR(2 downto 0)
    );
end Mux4x1_3b;


architecture behav of Mux4x1_3b is

begin

end architecture behav;
