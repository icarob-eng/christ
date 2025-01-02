entity full_adder is
	port(
		a, b, cin: in bit;
		cout, s: out bit
	);
end;

architecture behav of full_adder is

begin
	cout <= ( b and cin ) or ( a and cin ) or ( a and b  );
	s <= ( not a and not b and cin ) or ( not a and b and not cin ) or ( a and not b and not cin ) or ( a and b and cin  );
end;