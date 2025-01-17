entity Mux2x1_3b is
port(
	i0, i1 : in  BIT_VECTOR(2 downto 0);
	s      : in  bit;
	o      : out BIT_VECTOR(2 downto 0)
);
end Mux2x1_3b;

architecture behav of Mux2x1_3b is
begin 
	o(0) <= (NOT s AND i0(0)) OR
		    (s AND NOT i1(0));
	o(1) <= (NOT s AND i0(1)) OR
		    (s AND NOT i1(1));
	o(2) <= (NOT s AND i0(2)) OR
		    (s AND NOT i1(2));
end architecture behav;
