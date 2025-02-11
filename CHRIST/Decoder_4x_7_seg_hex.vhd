library ieee;
use ieee.std_logic_1164.all;

entity Decoder_4x_7_seg_hex is
port (
	binary_input  : in std_logic_vector(15 downto 0);
	out_display_3 : out std_logic_vector(6 downto 0);
	out_display_2 : out std_logic_vector(6 downto 0);
	out_display_1 : out std_logic_vector(6 downto 0);
	out_display_0 : out std_logic_vector(6 downto 0);
	clk			  : in  std_logic
);
end entity Decoder_4x_7_seg_hex;

architecture comb of Decoder_4x_7_seg_hex is

	component Decoder_7_seg is  -- common annode
	port (
		binary_input   : in std_logic_vector(3 downto 0);
		decoded_out		: out std_logic_vector(6 downto 0); -- a b c d e f g
		clk 				: in std_logic
	);
	end component;

	begin

	display_3 : Decoder_7_seg
	port map (
		binary_input => binary_input(15 downto 12),
		decoded_out	 => out_display_3,
		clk => clk
	);

	display_2 : Decoder_7_seg
	port map (
		binary_input => binary_input(11 downto 8),
		decoded_out	 => out_display_2,
		clk => clk
	);

	display_1 : Decoder_7_seg
	port map (
		binary_input => binary_input(7 downto 4),
		decoded_out	 => out_display_1,
		clk => clk
	);

	display_0 : Decoder_7_seg
	port map (
		binary_input => binary_input(3 downto 0),
		decoded_out	 => out_display_0,
		clk => clk
	);

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity Decoder_7_seg is  -- common annode
port (
	binary_input   : in std_logic_vector(3 downto 0);
	decoded_out		: out std_logic_vector(6 downto 0); -- a b c d e f g
	clk 				: in std_logic
);
end entity Decoder_7_seg;

architecture comb of Decoder_7_seg is

	component Reg_8b is
	port (
		input    : in  std_logic_vector(7 downto 0);
		output   : out std_logic_vector(7 downto 0);
		write_en : in  std_logic;
		clk      : in  std_logic
	);
	end component;
	
	signal BUS_DATA_2_REG_DECODED_OUT : std_logic_vector(6 downto 0);
	
	alias i3 : std_logic is binary_input(3);
	alias i2 : std_logic is binary_input(2);
	alias i1 : std_logic is binary_input(1);
	alias i0 : std_logic is binary_input(0);
	

	
	alias a : std_logic is BUS_DATA_2_REG_DECODED_OUT(6);
	alias b : std_logic is BUS_DATA_2_REG_DECODED_OUT(5);
	alias c : std_logic is BUS_DATA_2_REG_DECODED_OUT(4);
	alias d : std_logic is BUS_DATA_2_REG_DECODED_OUT(3);
	alias e : std_logic is BUS_DATA_2_REG_DECODED_OUT(2);
	alias f : std_logic is BUS_DATA_2_REG_DECODED_OUT(1);
	alias g : std_logic is BUS_DATA_2_REG_DECODED_OUT(0);

begin

	reg : reg_8b
	port map (
		input => '0' & BUS_DATA_2_REG_DECODED_OUT,
		output(6 downto 0) => decoded_out(6 downto 0),
		write_en => '1',
		clk => clk
	);

	a <=	(not i3 and not i2 and not i1 and i0) or
			(not i3 and i2 and not i1 and not i0) or
			(i3 and not i2 and i1 and i0) or
			(i3 and i2 and not i1 and i0);

	b <=	(not i3 and i2 and not i1 and i0) or
			(not i3 and i2 and i1 and not i0) or
			(i3 and not i2 and i1 and i0) or
			(i3 and i2 and not i1 and not i0) or
			(i3 and i2 and i1 and not i0) or
			(i3 and i2 and i1 and i0);


	c <= (not i3 and not i2 and i1 and not i0) or
		(i3 and i2 and not i1 and not i0) or
		(i3 and i2 and i1 and not i0) or
		(i3 and i2 and i1 and i0);


	d <=	(not i3 and not i2 and not i1 and i0) or
			(not i3 and i2 and not i1 and not i0) or
			(not i3 and i2 and i1 and i0) or
			(i3 and not i2 and i1 and not i0) or
			(i3 and i2 and i1 and i0);


	e <=	(not i3 and not i2 and not i1 and i0) or
		(not i3 and not i2 and i1 and i0) or
		(not i3 and i2 and not i1 and not i0) or
		(not i3 and i2 and not i1 and i0) or
		(not i3 and i2 and i1 and i0) or
		(i3 and not i2 and not i1 and i0);


	f <=	(not i3 and not i2 and not i1 and i0) or
			(not i3 and not i2 and i1 and not i0) or
			(not i3 and not i2 and i1 and i0) or
			(not i3 and i2 and i1 and i0) or
			(i3 and i2 and not i1 and i0);


	g <=	(not i3 and not i2 and not i1 and not i0) or
			(not i3 and not i2 and not i1 and i0) or
			(not i3 and i2 and i1 and i0) or
			(i3 and i2 and not i1 and not i0);


end comb;
