entity abext is
	port(
		ops_alu: in bit_vector(3 downto 0);
		ia, ib: in bit;
		oa, ob: out bit	
	);
end;

architecture behav of abext is
	signal op: bit_vector(3 downto 0);
begin
	op <= ops_alu;

	oa <= ( not op(3) and not op(2) and ia ) or ( not op(3) and not op(0) and ia ) or ( not op(3) and not op(1) and ia and ib ) or ( not op(3) and op(1) and ia and not ib ) or ( not op(3) and op(2) and op(1) and not ia and ib ) or ( op(3) and not op(2) and not op(1) and not op(0) and not ia  );
	
	ob <= ( not op(3) and op(2) and not op(1) and not op(0) ) or ( not op(3) and not op(2) and not op(1) and op(0) and ib ) or ( not op(3) and not op(2) and op(1) and not op(0) and not ib  );
end;
