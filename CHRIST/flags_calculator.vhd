entity Flags_Calculator is
	port(
		s: in bit_vector(15 downto 0);
		a_15, cout_15, cout_14: in bit;
		flags: out bit_vector(2 downto 0)
	);
end;

architecture behav of Flags_Calculator is
	
	-- signal zero, mtz, underflow, overflow: bit;
	
begin

-- vvvvvvv zero
	flags(2) <= not s(15) and not s(14) and not s(13) and not s(12) and not s(11) and not s(10) and not s(9) and not s(8) and not s(7) and not s(6) and not s(5) and not s(4) and not s(3) and not s(2) and not s(1) and not s(0);
	
-- vvvvvvv less than zero 	
	flags(1) <= s(15);

-- vvvvvvv overflow
	flags(0) <= (cout_15 xor cout_14); 
	
-- vvvvvvv underflow
--	flags(1) <= a_15 and (cout_15 xor cout_14);
	

	
--	flags(2) <= not zero and not mtz and not underflow and not overflow;
--	flags(1) <= underflow or overflow;
--	flags(0) <= (mtz and not underflow and not overflow) or (overflow);

end;