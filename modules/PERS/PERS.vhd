
entity PERS is  -- periferals module. TODO: add external connections
    port(
        addr       : in BIT_VECTOR(2 downto 0);  -- 2^3 periferals
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        bus_in      : in BIT_VECTOR(15 downto 0); 
        bus_out     : out BIT_VECTOR(15 downto 0);
		  
        ext_out_leds	      : out BIT_VECTOR(15 downto 0);
		  
        ext_out_7seg_3     : out BIT_VECTOR(6 downto 0);
        ext_out_7seg_2     : out BIT_VECTOR(6 downto 0);
		  ext_out_7seg_1     : out BIT_VECTOR(6 downto 0);
		  ext_out_7seg_0     : out BIT_VECTOR(6 downto 0);
		  
		  ext_in_switches    : in BIT_VECTOR(15 downto 0);
		  ext_in_buttons     : in BIT_VECTOR(15 downto 0);
		  
        clk        : in bit
    );
end PERS;

architecture behav of PERS is

	signal BUS_REG_PER_0 : bit_vector(15 downto 0); -- 0000(hex) fixed
	signal BUS_REG_PER_1 : bit_vector(15 downto 0); -- 16 leds
	signal BUS_REG_PER_2 : bit_vector(15 downto 0); -- Display 7 seg 3, 2, 1 and 0
	signal BUS_REG_PER_3 : bit_vector(15 downto 0); 
	signal BUS_REG_PER_4 : bit_vector(15 downto 0); -- 16 swichs
	signal BUS_REG_PER_5 : bit_vector(15 downto 0);
	signal BUS_REG_PER_6 : bit_vector(15 downto 0);
	signal BUS_REG_PER_7 : bit_vector(15 downto 0);

component Reg_16b is
    port(
        input    : in BIT_VECTOR(15 downto 0);
        output   : out BIT_VECTOR(15 downto 0);
        write_en : in bit;
        clk      : in bit
    );
end component;

component Decoder_4x_7_seg_hex is
port (
	binary_input  : in bit_vector(15 downto 0);
	out_display_3 : out bit_vector(6 downto 0);
	out_display_2 : out bit_vector(6 downto 0);
	out_display_1 : out bit_vector(6 downto 0);
	out_display_0 : out bit_vector(6 downto 0);
	clk			  : in  bit
);
end component Decoder_4x_7_seg_hex;


component My_Mux8x1_16b is
    port(
        i000, i001, i010, i011, i100, i101, i110, i111 : in  BIT_VECTOR(15 downto 0);
        s0, s1, s2                                     : in  bit;
		  en															 : in bit;
        o                                              : out BIT_VECTOR(15 downto 0)
    );
end component;


	alias addr2 : bit is addr(2);
	alias addr1 : bit is addr(1);
	alias addr0 : bit is addr(0);

begin


	per_reg_0: Reg_16b    -- Only read : 00 00 (hex) : OUTPUT-PER not writable
	 port map (
			  input    => "0000000000000000",
			  output   => BUS_REG_PER_0,
			  write_en => '0',
			  clk      => clk
	 );
	 
	per_reg_1: Reg_16b    -- 16 leds                 : OUTPUT-PER writable
	 port map (
			  input    => bus_in,
			  output   => BUS_REG_PER_1,
			  write_en => (not addr2) and (not addr1) and (addr0) and w_en,
			  clk      => clk
	 );
	 
	 per_reg_2: Reg_16b    -- 7 seg display (1 0)    : OUTPUT-PER writable
	 port map (
			  input    => bus_in,
			  output   => BUS_REG_PER_2,
			  write_en => (not addr2) and (addr1) and (not addr0) and w_en,
			  clk      => clk
	 );
	 
	 
	 per_reg_3: Reg_16b    -- 7 seg display (3 2)    : OUTPUT-PER writable
	 port map (
			  input    => bus_in,
			  output   => BUS_REG_PER_3,
			  write_en => (not addr2) and (addr1) and (addr0) and w_en,
			  clk      => clk
	 );
	 
	 
	 
	 per_reg_4: Reg_16b    -- 16 swiches			 : INPUT-PER
	 port map (
			  input    => ext_in_switches ,
			  output   => BUS_REG_PER_4,
			  write_en => '1', -- EN_WRITE_REG_PER(4)
			  clk      => clk
	 );
	 
	 per_reg_5: Reg_16b    -- 4 push buttons			 : INPUT-PER
	 port map (
			  input    => ext_in_buttons,
			  output   => BUS_REG_PER_5,
			  write_en => '1', -- EN_WRITE_REG_PER(5)
			  clk      => clk
	 );
	 
	 
	 -- we have not yet associated a peripheral with this register. Therefore, it is currently deactivated.
	 per_reg_6: Reg_16b    -- Only read : 00 00 (hex) : OUTPUT-PER not writable
	 port map (
			  input    => "0000000000000000",  --
			  output   => BUS_REG_PER_6,
			  write_en => '0', -- EN_WRITE_REG_PER(6)
			  clk      => clk
	 );
	 
	 
	 -- we have not yet associated a peripheral with this register. Therefore, it is currently deactivated.
	 per_reg_7: Reg_16b    -- Only read : 00 00 (hex) : OUTPUT-PER not writable
	 port map (
			  input    => "0000000000000000",
			  output   => BUS_REG_PER_7,
			  write_en => '0', -- EN_WRITE_REG_PER(5)
			  clk      => clk
	 );

	 
	-- Note that all register outputs are connected to a BUS_REG_PER_X, where X is a number from 0 to 7.

	-- output connetions 

	ext_out_leds <= BUS_REG_PER_1;
		

	
	decoder_displays_7seg : Decoder_4x_7_seg_hex
	port map (
		binary_input => BUS_REG_PER_2,
		out_display_3  => ext_out_7seg_3,
		out_display_2  => ext_out_7seg_2,
		out_display_1  => ext_out_7seg_1,
		out_display_0  => ext_out_7seg_0,
		clk => clk
	);


	mux_out : My_Mux8x1_16b
	port map(
		i000 => BUS_REG_PER_0,
		i001 => BUS_REG_PER_1,
		i010 => BUS_REG_PER_2,
		i011 => BUS_REG_PER_3,
		i100 => BUS_REG_PER_4,
		i101 => BUS_REG_PER_5,
		i110 => BUS_REG_PER_6,
		i111 => BUS_REG_PER_7,
		
		en => r_en,
		
		s0 => addr0,
		s1 => addr1,
		s2 => addr2,
		
		o => bus_out
	);

end architecture behav;
