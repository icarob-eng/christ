entity ALU is
port (op: in bit_vector( 4 downto 0);
		a, b: in bit_vector( 15 downto 0);
		r: out bit_vector(15 downto 0);
		flags: out bit_vector( 2 downto 0)
);
end;

-- todo: add comments

architecture behav of ALU is

	component extensor_alu is
		port(
			a, b: in bit_vector(15 downto 0);
			op: in bit_vector(3 downto 0);
			out_ext_a, out_ext_b: out bit_vector(15 downto 0);
			cin : out bit
		);
	end component;
	
	component adder is
		port(
			a, b: in bit_vector(15 downto 0);
			cin: in bit;
			flags: out bit_vector(2 downto 0);
			r: out bit_vector(15 downto 0)
		);
	end component;
	
	signal out_ext_a, out_ext_b: bit_vector(15 downto 0);
	signal cin : bit;

begin

	u0: extensor_alu port map (a => a, b => b, op => op(3 downto 0), out_ext_a => out_ext_a, out_ext_b => out_ext_b, cin => cin);
	u1: adder port map (a => out_ext_a, b => out_ext_b, cin => cin, r => r, flags => flags);
	
end;