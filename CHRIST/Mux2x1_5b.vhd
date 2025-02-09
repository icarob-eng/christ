entity Mux2x1_5b is
    port(
        i0, i1 : in  BIT_VECTOR(4 downto 0);
        s      : in  bit;
        o      : out BIT_VECTOR(4 downto 0)
    );
end Mux2x1_5b;


architecture behav of Mux2x1_5b is

begin
    o(0) <= (NOT s AND i0(0)) OR
		    (s AND i1(0));
	o(1) <= (NOT s AND i0(1)) OR
		    (s AND i1(1));
	o(2) <= (NOT s AND i0(2)) OR
		    (s AND i1(2));
	o(3) <= (NOT s AND i0(3)) OR
		    (s AND i1(3));
	o(4) <= (NOT s AND i0(4)) OR
		    (s AND i1(4));

end architecture behav;
