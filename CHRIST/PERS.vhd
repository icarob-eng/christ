library ieee;
use ieee.std_logic_1164.all;

entity PERS is  -- periferals module
    port(
        addr       : in std_logic_vector(2 downto 0);  -- 2^3 periferals
        r_en, w_en : in std_logic; -- Read/Write Enable (0 is read)
        bus_in      : in std_logic_vector(15 downto 0);
        bus_out     : out std_logic_vector(15 downto 0);
		  
        ext_out_leds	      : out std_logic_vector(15 downto 0);
		  
        ext_out_7seg_3     : out std_logic_vector(6 downto 0);
        ext_out_7seg_2     : out std_logic_vector(6 downto 0);
		  ext_out_7seg_1     : out std_logic_vector(6 downto 0);
		  ext_out_7seg_0     : out std_logic_vector(6 downto 0);
		  
		  ext_in_switches    : in std_logic_vector(15 downto 0);
		  ext_in_buttons     : in std_logic_vector(15 downto 0);
		  
        clk        : in std_logic
    );
end PERS;

architecture behav of PERS is

	signal BUS_REG_PER_0 : std_logic_vector(15 downto 0); -- 0000(hex) fixed
	signal BUS_REG_PER_1 : std_logic_vector(15 downto 0); -- 16 leds
	signal BUS_REG_PER_2 : std_logic_vector(15 downto 0); -- Display 7 seg 3, 2, 1 and 0
	signal BUS_REG_PER_3 : std_logic_vector(15 downto 0);
	signal BUS_REG_PER_4 : std_logic_vector(15 downto 0); -- 16 swichs
	signal BUS_REG_PER_5 : std_logic_vector(15 downto 0);
	signal BUS_REG_PER_6 : std_logic_vector(15 downto 0);
	signal BUS_REG_PER_7 : std_logic_vector(15 downto 0);

component Reg_16b is
    port(
        input    : in std_logic_vector(15 downto 0);
        output   : out std_logic_vector(15 downto 0);
        write_en : in std_logic;
        clk      : in std_logic
    );
end component;

component Decoder_4x_7_seg_hex is
port (
	binary_input  : in std_logic_vector(15 downto 0);
	out_display_3 : out std_logic_vector(6 downto 0);
	out_display_2 : out std_logic_vector(6 downto 0);
	out_display_1 : out std_logic_vector(6 downto 0);
	out_display_0 : out std_logic_vector(6 downto 0);
	clk			  : in  std_logic
);
end component Decoder_4x_7_seg_hex;


component My_Mux8x1_16b is
    port(
        i000, i001, i010, i011, i100, i101, i110, i111 : in  std_logic_vector(15 downto 0);
        s0, s1, s2                                     : in  std_logic;
		  en															 : in std_logic;
        o                                              : out std_logic_vector(15 downto 0)
    );
end component;


	alias addr2 : std_logic is addr(2);
	alias addr1 : std_logic is addr(1);
	alias addr0 : std_logic is addr(0);

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
