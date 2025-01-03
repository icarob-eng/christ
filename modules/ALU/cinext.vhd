entity cinext is
	port(
		op: in bit_vector(3 downto 0);
		cin: out bit	
	);
end;

architecture behav of cinext is
begin
	cin <= ( not op(3) and not op(2) and op(1)  );
end;
