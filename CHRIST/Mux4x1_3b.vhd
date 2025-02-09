entity Mux4x1_3b is
    port(
        i00, i01, i10, i11 : in  BIT_VECTOR(2 downto 0);
        s0, s1             : in  bit;
        o                  : out BIT_VECTOR(2 downto 0)
    );
end Mux4x1_3b;


architecture behav of Mux4x1_3b is

begin
    o(0) <= (not s1 and not s0 and i00(0)) or
               (not s1 and s0 and i01(0)) or
               (s1 and not s0 and i10(0)) or
               (s1 and s0 and i11(0));
        o(1) <= (not s1 and not s0 and i00(1)) or
               (not s1 and s0 and i01(1)) or
               (s1 and not s0 and i10(1)) or
               (s1 and s0 and i11(1));
        o(2) <= (not s1 and not s0 and i00(2)) or
               (not s1 and s0 and i01(2)) or
               (s1 and not s0 and i10(2)) or
               (s1 and s0 and i11(2));

end architecture behav;
