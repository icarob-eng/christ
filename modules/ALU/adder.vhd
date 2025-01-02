entity adder is
	port(
		a, b: in bit_vector(15 downto 0);
		cin: in bit;
		-- flags out
		res: out bit_vector(15 downto 0)
	);
end;

architecture behav of adder is

	component full_adder is
		port(
			a, b, cin: in bit;
			cout, s: out bit
		);
	end component;
	
	signal couts: bit_vector(15 downto 0);
	
begin
	u15: full_adder port map(a => a(15), b => b(15), cin => couts(14), s => res(15), cout => couts(15));
	u14: full_adder port map(a => a(14), b => b(14), cin => couts(13), s => res(14), cout => couts(14));
	u13: full_adder port map(a => a(13), b => b(13), cin => couts(12), s => res(13), cout => couts(13));
	u12: full_adder port map(a => a(12), b => b(12), cin => couts(11), s => res(12), cout => couts(12));
	u11: full_adder port map(a => a(11), b => b(11), cin => couts(10), s => res(11), cout => couts(11));
	u10: full_adder port map(a => a(10), b => b(10), cin => couts(9), s => res(10), cout => couts(10));
	u9: full_adder port map(a => a(9), b => b(9), cin => couts(8), s => res(9), cout => couts(9));
	u8: full_adder port map(a => a(8), b => b(8), cin => couts(7), s => res(8), cout => couts(8));
	u7: full_adder port map(a => a(7), b => b(7), cin => couts(6), s => res(7), cout => couts(7));
	u6: full_adder port map(a => a(6), b => b(6), cin => couts(5), s => res(6), cout => couts(6));
	u5: full_adder port map(a => a(5), b => b(5), cin => couts(4), s => res(5), cout => couts(5));
	u4: full_adder port map(a => a(4), b => b(4), cin => couts(3), s => res(4), cout => couts(4));
	u3: full_adder port map(a => a(3), b => b(3), cin => couts(2), s => res(3), cout => couts(3));
	u2: full_adder port map(a => a(2), b => b(2), cin => couts(1), s => res(2), cout => couts(2));
	u1: full_adder port map(a => a(1), b => b(1), cin => couts(0), s => res(1), cout => couts(1));
	u0: full_adder port map(a => a(0), b => b(0), cin => cin, s => res(0), cout => couts(0));
end;