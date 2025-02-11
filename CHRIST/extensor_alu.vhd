library ieee;
use ieee.std_logic_1164.all;

entity CINExt is
	port(
		op: in std_logic_vector(3 downto 0);
		cin: out std_logic
	);
end CINExt;

architecture behav of CINExt is
begin
	cin <= ( not op(3) and not op(2) and op(1)  );
end;


library ieee;
use ieee.std_logic_1164.all;

entity ABExt is
	port(
		op: in std_logic_vector(3 downto 0);
		ia, ib: in std_logic;
		oa, ob: out std_logic
	);
end ABExt;

architecture behav of ABExt is

begin
	oa <= ( not op(3) and not op(2) and ia ) or ( not op(3) and not op(0) and ia ) or ( not op(3) and not op(1) and ia and ib ) or ( not op(3) and op(1) and ia and not ib ) or ( not op(3) and op(2) and op(1) and not ia and ib ) or ( op(3) and not op(2) and not op(1) and not op(0) and not ia  );

	ob <= ( not op(3) and op(2) and not op(1) and not op(0) ) or ( not op(3) and not op(2) and not op(1) and op(0) and ib ) or ( not op(3) and not op(2) and op(1) and not op(0) and not ib  );
end;

library ieee;
use ieee.std_logic_1164.all;

entity Extensor_ALU is
	port(
		a, b: in std_logic_vector(15 downto 0);
		op: in std_logic_vector(3 downto 0);
		out_ext_a, out_ext_b: out std_logic_vector(15 downto 0);
		cin : out std_logic
	);
end;

architecture behav of Extensor_ALU is
	
	component ABExt is
		port(
			op: in std_logic_vector(3 downto 0);
			ia, ib: in std_logic;
			oa, ob: out std_logic
		);
	end component;
	
	component CINExt is
		port(
			op: in std_logic_vector(3 downto 0);
			cin: out std_logic
		);
	end component;
	
begin
	
	abext15: ABExt port map(op => op, ia => a(15), ib => b(15), oa => out_ext_a(15), ob => out_ext_b(15));
	abext14: ABExt port map(op => op, ia => a(14), ib => b(14), oa => out_ext_a(14), ob => out_ext_b(14));
	abext13: ABExt port map(op => op, ia => a(13), ib => b(13), oa => out_ext_a(13), ob => out_ext_b(13));
	abext12: ABExt port map(op => op, ia => a(12), ib => b(12), oa => out_ext_a(12), ob => out_ext_b(12));
	abext11: ABExt port map(op => op, ia => a(11), ib => b(11), oa => out_ext_a(11), ob => out_ext_b(11));
	abext10: ABExt port map(op => op, ia => a(10), ib => b(10), oa => out_ext_a(10), ob => out_ext_b(10));
	abext9: ABExt port map(op => op, ia => a(9), ib => b(9), oa => out_ext_a(9), ob => out_ext_b(9));
	abext8: ABExt port map(op => op, ia => a(8), ib => b(8), oa => out_ext_a(8), ob => out_ext_b(8));
	abext7: ABExt port map(op => op, ia => a(7), ib => b(7), oa => out_ext_a(7), ob => out_ext_b(7));
	abext6: ABExt port map(op => op, ia => a(6), ib => b(6), oa => out_ext_a(6), ob => out_ext_b(6));
	abext5: ABExt port map(op => op, ia => a(5), ib => b(5), oa => out_ext_a(5), ob => out_ext_b(5));
	abext4: ABExt port map(op => op, ia => a(4), ib => b(4), oa => out_ext_a(4), ob => out_ext_b(4));
	abext3: ABExt port map(op => op, ia => a(3), ib => b(3), oa => out_ext_a(3), ob => out_ext_b(3));
	abext2: ABExt port map(op => op, ia => a(2), ib => b(2), oa => out_ext_a(2), ob => out_ext_b(2));
	abext1: ABExt port map(op => op, ia => a(1), ib => b(1), oa => out_ext_a(1), ob => out_ext_b(1));
	abext0: ABExt port map(op => op, ia => a(0), ib => b(0), oa => out_ext_a(0), ob => out_ext_b(0));
	
	cinext0: CINExt port map(op => op, cin => cin);
	
end;
