entity extensor_alu is
	port(
		a, b: in bit_vector(15 downto 0);
		op: in bit_vector(3 downto 0);
		out_ext_a, out_ext_b: out bit_vector(15 downto 0);
		cin : out bit
	);
end;

architecture behav of extensor_alu is
	
	component abext is
		port(
			op: in bit_vector(3 downto 0);
			ia, ib: in bit;
			oa, ob: out bit	
		);
	end component;
	
	component cinext is
		port(
			op: in bit_vector(3 downto 0);
			cin: out bit	
		);
	end component;
	
begin
	
	u15: abext port map(op => op, ia => a(15), ib => b(15), oa => out_ext_a(15), ob => out_ext_b(15));
	u14: abext port map(op => op, ia => a(14), ib => b(14), oa => out_ext_a(14), ob => out_ext_b(14));
	u13: abext port map(op => op, ia => a(13), ib => b(13), oa => out_ext_a(13), ob => out_ext_b(13));
	u12: abext port map(op => op, ia => a(12), ib => b(12), oa => out_ext_a(12), ob => out_ext_b(12));
	u11: abext port map(op => op, ia => a(11), ib => b(11), oa => out_ext_a(11), ob => out_ext_b(11));
	u10: abext port map(op => op, ia => a(10), ib => b(10), oa => out_ext_a(10), ob => out_ext_b(10));
	u9: abext port map(op => op, ia => a(9), ib => b(9), oa => out_ext_a(9), ob => out_ext_b(9));
	u8: abext port map(op => op, ia => a(8), ib => b(8), oa => out_ext_a(8), ob => out_ext_b(8));
	u7: abext port map(op => op, ia => a(7), ib => b(7), oa => out_ext_a(7), ob => out_ext_b(7));
	u6: abext port map(op => op, ia => a(6), ib => b(6), oa => out_ext_a(6), ob => out_ext_b(6));
	u5: abext port map(op => op, ia => a(5), ib => b(5), oa => out_ext_a(5), ob => out_ext_b(5));
	u4: abext port map(op => op, ia => a(4), ib => b(4), oa => out_ext_a(4), ob => out_ext_b(4));
	u3: abext port map(op => op, ia => a(3), ib => b(3), oa => out_ext_a(3), ob => out_ext_b(3));
	u2: abext port map(op => op, ia => a(2), ib => b(2), oa => out_ext_a(2), ob => out_ext_b(2));
	u1: abext port map(op => op, ia => a(1), ib => b(1), oa => out_ext_a(1), ob => out_ext_b(1));
	u0: abext port map(op => op, ia => a(0), ib => b(0), oa => out_ext_a(0), ob => out_ext_b(0));
	
	u_cin: cinext port map(op => op, cin => cin);
	
end;