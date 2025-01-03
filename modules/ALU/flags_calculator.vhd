entity flags_calculator is
	port(
		s: in bit_vector(15 downto 0);
		a_15, cout_15, cout_14: in bit;
		flags: out bit_vector(2 downto 0)
	);
end;

architecture behav of flags_calculator is
	
	signal zero, mtz, underflow, overflow: bit;
	
begin
	zero <= not s(15) and not s(14) and not s(13) and not s(12) and not s(11) and not s(10) and not s(9) and not s(8) and not s(7) and not s(6) and not s(5) and not s(4) and not s(3) and not s(2) and not s(1) and not s(0);
	mtz <= not s(15) and (s(14) or s(13) or s(12) or s(11) or s(10) or s(9) or s(8) or s(7) or s(6) or s(5) or s(4) or s(3) or s(2) or s(1) or s(0));
	underflow <= a_15 and (cout_15 xor cout_14);
	overflow <= not a_15 and (cout_15 xor cout_14);
	
	flags(2) <= not zero and not mtz and not underflow and not overflow;
	flags(1) <= underflow or overflow;
	flags(0) <= (mtz and not underflow and not overflow) or (overflow);
end;