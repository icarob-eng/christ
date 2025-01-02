entity ALU is
port (ops_alu: in bit_vector( 3 downto 0);
		reg_a, reg_b: in bit_vector( 15 downto 0);
		res: out bit_vector(15 downto 0);
		flag: out bit_vector( 2 downto 0)
);
end;

architecture behav of ALU is
	component extensor_alu is
		port(
			reg_a, reg_b: in bit_vector(15 downto 0);
			ops_alu: in bit_vector(3 downto 0);
			out_ext_a, out_ext_b: out bit_vector(15 downto 0);
			cin : out bit
		);
	end component;
	component adder is
		port(
			a, b: in bit_vector(15 downto 0);
			cin: in bit;
			-- flags out
			res: out bit_vector(15 downto 0)
		);
	end component;
	
	signal out_ext_a, out_ext_b: bit_vector(15 downto 0);
	signal cin : bit;

begin

	u0: extensor_alu port map (reg_a => reg_a, reg_b => reg_b, ops_alu => ops_alu, out_ext_a => out_ext_a, out_ext_b => out_ext_b, cin => cin);
	u1: adder port map (a => out_ext_a, b => out_ext_b, cin => cin, res => res);
	
end;