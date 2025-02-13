library ieee;
use ieee.std_logic_1164.all;

entity Mux4x1_16b is
    port(
        i00, i01, i10, i11 : in  std_logic_vector(15 downto 0);
        s0, s1             : in  std_logic;
        o                  : out std_logic_vector(15 downto 0)
    );
end Mux4x1_16b;

architecture behav of Mux4x1_16b is
	signal s_aux : std_logic_vector(1 downto 0);
begin
	s_aux <= s1&s0;
	with s_aux select o <= i00 when "00", i01 when "01", i10  when "10", i11 when "11";
end architecture behav;


library ieee;
use ieee.std_logic_1164.all;

entity My_Mux8x1_16b is
    port(
        i000, i001, i010, i011, i100, i101, i110, i111 : in  std_logic_vector(15 downto 0);
        en                                             : in  std_logic;
        s0, s1, s2                                     : in  std_logic;
        o                                              : out std_logic_vector(15 downto 0)
    );
end My_Mux8x1_16b;

architecture behav of My_Mux8x1_16b is
	signal s_aux : std_logic_vector(2 downto 0);
begin
	s_aux <= s2 & s1 & s0;
   with s_aux select o <= i000 when "000", i001 when "001", i010 when "010", i011 when "011",
	                               i100 when "100", i101 when "101", i110 when "110", i111 when "111";
end behav;

