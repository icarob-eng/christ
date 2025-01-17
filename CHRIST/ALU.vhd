entity ALU is
    port(
        a, b  : in BIT_VECTOR(15 downto 0);
        op    : in BIT_VECTOR(4 downto 0);
        flags : out BIT_VECTOR(2 downto 0);
        r     : out BIT_VECTOR(15 downto 0)
    );
end ALU;

architecture behav of ALU is


	component Extensor_ALU is
		port(
			a, b: in bit_vector(15 downto 0);
			op: in bit_vector(3 downto 0);
			out_ext_a, out_ext_b: out bit_vector(15 downto 0);
			cin : out bit
		);
	end component;
	
	component Adder_16b_ALU is
		port(
			a, b: in bit_vector(15 downto 0);
			cin: in bit;
			flags: out bit_vector(2 downto 0);
			r: out bit_vector(15 downto 0)
		);
	end component;
	
	signal OUT_EXT_A, OUT_EXT_B: bit_vector(15 downto 0); -- extensors outputs
	signal CIN : bit;

begin

	extensor: Extensor_ALU port map (a => a, b => b, op => op(3 downto 0), out_ext_a => OUT_EXT_A, out_ext_b => OUT_EXT_B, cin => CIN);
	adder: Adder_16b_ALU port map (a => OUT_EXT_A, b => OUT_EXT_B, cin => CIN, r => r, flags => flags);

end architecture behav;
