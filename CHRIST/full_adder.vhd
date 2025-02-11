library ieee;
use ieee.std_logic_1164.all;

entity Full_Adder is
	port(
		a, b, cin: in std_logic;
		cout, s: out std_logic
	);
end;

architecture behav of Full_Adder is

begin
	cout <= ( b and cin ) or ( a and cin ) or ( a and b  );
	s <= ( not a and not b and cin ) or ( not a and b and not cin ) or ( a and not b and not cin ) or ( a and b and cin  );
end;
