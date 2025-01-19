entity Decoder_4x_7_seg_hex is
port (
	binary_input  : in bit_vector(15 downto 0);
	out_display_3 : out bit_vector(6 downto 0);
	out_display_2 : out bit_vector(6 downto 0);
	out_display_1 : out bit_vector(6 downto 0);
	out_display_0 : out bit_vector(6 downto 0);
	clk			  : in  bit
);
end entity Decoder_4x_7_seg_hex;


architecture comb of Decoder_4x_7_seg_hex is

component Decoder_7_seg is  -- common annode
port (
	binary_input   : in bit_vector(3 downto 0);
	decoded_out		: out bit_vector(6 downto 0); -- a b c d e f g
	clk 				: in bit
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
















entity Decoder_7_seg is  -- common annode
port (
	binary_input   : in bit_vector(3 downto 0);
	decoded_out		: out bit_vector(6 downto 0); -- a b c d e f g
	clk 				: in bit
);
end entity Decoder_7_seg;

architecture comb of Decoder_7_seg is

	component Reg_8b is
	port (
		input    : in  BIT_VECTOR(7 downto 0);
		output   : out BIT_VECTOR(7 downto 0);
		write_en : in  bit;
		clk      : in  bit
	);
	end component;
	
	signal BUS_DATA_2_REG_DECODED_OUT : bit_vector(6 downto 0);
	
	alias i3 : bit is binary_input(3);
	alias i2 : bit is binary_input(2);
	alias i1 : bit is binary_input(1);
	alias i0 : bit is binary_input(0);
	

	
	alias a : bit is BUS_DATA_2_REG_DECODED_OUT(6);
	alias b : bit is BUS_DATA_2_REG_DECODED_OUT(5);
	alias c : bit is BUS_DATA_2_REG_DECODED_OUT(4);
	alias d : bit is BUS_DATA_2_REG_DECODED_OUT(3);
	alias e : bit is BUS_DATA_2_REG_DECODED_OUT(2);
	alias f : bit is BUS_DATA_2_REG_DECODED_OUT(1);
	alias g : bit is BUS_DATA_2_REG_DECODED_OUT(0);

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