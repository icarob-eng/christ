entity Mux4x1_16b is
    port(
        i00, i01, i10, i11 : in  BIT_VECTOR(15 downto 0);
        s0, s1             : in  bit;
        o                  : out BIT_VECTOR(15 downto 0)
    );
end Mux4x1_16b;


architecture behav of Mux4x1_16b is

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
	o(3) <= (not s1 and not s0 and i00(3)) or
               (not s1 and s0 and i01(3)) or
               (s1 and not s0 and i10(3)) or
               (s1 and s0 and i11(3));
	o(4) <= (not s1 and not s0 and i00(4)) or
               (not s1 and s0 and i01(4)) or
               (s1 and not s0 and i10(4)) or
               (s1 and s0 and i11(4));
	o(5) <= (not s1 and not s0 and i00(5)) or
               (not s1 and s0 and i01(5)) or
               (s1 and not s0 and i10(5)) or
               (s1 and s0 and i11(5));
	o(6) <= (not s1 and not s0 and i00(6)) or
               (not s1 and s0 and i01(6)) or
               (s1 and not s0 and i10(6)) or
               (s1 and s0 and i11(6));
	o(7) <= (not s1 and not s0 and i00(7)) or
               (not s1 and s0 and i01(7)) or
               (s1 and not s0 and i10(7)) or
               (s1 and s0 and i11(7));
	o(8) <= (not s1 and not s0 and i00(8)) or
               (not s1 and s0 and i01(8)) or
               (s1 and not s0 and i10(8)) or
               (s1 and s0 and i11(8));
	o(9) <= (not s1 and not s0 and i00(9)) or
               (not s1 and s0 and i01(9)) or
               (s1 and not s0 and i10(9)) or
               (s1 and s0 and i11(9));
	o(10) <= (not s1 and not s0 and i00(10)) or
               (not s1 and s0 and i01(10)) or
               (s1 and not s0 and i10(10)) or
               (s1 and s0 and i11(10));
	o(11) <= (not s1 and not s0 and i00(11)) or
               (not s1 and s0 and i01(11)) or
               (s1 and not s0 and i10(11)) or
               (s1 and s0 and i11(11));
	o(12) <= (not s1 and not s0 and i00(12)) or
               (not s1 and s0 and i01(12)) or
               (s1 and not s0 and i10(12)) or
               (s1 and s0 and i11(12));
	o(13) <= (not s1 and not s0 and i00(13)) or
               (not s1 and s0 and i01(13)) or
               (s1 and not s0 and i10(13)) or
               (s1 and s0 and i11(13));
	o(14) <= (not s1 and not s0 and i00(14)) or
               (not s1 and s0 and i01(14)) or
               (s1 and not s0 and i10(14)) or
               (s1 and s0 and i11(14));
	o(15) <= (not s1 and not s0 and i00(15)) or
               (not s1 and s0 and i01(15)) or
               (s1 and not s0 and i10(15)) or
               (s1 and s0 and i11(15));

end architecture behav;
