entity cinext is
	port(
		ops_alu: in bit_vector(3 downto 0);
		cin: out bit	
	);
end;

architecture behav of cinext is
	signal op: bit_vector(3 downto 0);
begin
	op <= ops_alu;
	
	cin <= ( not op(3) and not op(2) and op(1)  );
end;
