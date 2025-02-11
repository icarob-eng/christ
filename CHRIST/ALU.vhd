library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port(
        a, b  : in std_logic_vector(15 downto 0);
        op    : in std_logic_vector(4 downto 0);
        flags : out std_logic_vector(2 downto 0);
        r     : out std_logic_vector(15 downto 0)
    );
end ALU;

architecture behav of ALU is


	component Extensor_ALU is
		port(
			a, b: in std_logic_vector(15 downto 0);
			op: in std_logic_vector(3 downto 0);
			out_ext_a, out_ext_b: out std_logic_vector(15 downto 0);
			cin : out std_logic
		);
	end component;
	
	component Adder_16b_ALU is
		port(
			a, b: in std_logic_vector(15 downto 0);
			cin: in std_logic;
			flags: out std_logic_vector(2 downto 0);
			r: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal OUT_EXT_A, OUT_EXT_B: std_logic_vector(15 downto 0); -- extensors outputs
	signal CIN : std_logic;

begin

	extensor: Extensor_ALU port map (a => a, b => b, op => op(3 downto 0), out_ext_a => OUT_EXT_A, out_ext_b => OUT_EXT_B, cin => CIN);
	adder: Adder_16b_ALU port map (a => OUT_EXT_A, b => OUT_EXT_B, cin => CIN, r => r, flags => flags);

end architecture behav;
