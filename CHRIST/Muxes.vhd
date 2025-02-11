library ieee;
use ieee.std_logic_1164.all;

entity Mux2x1_3b is
    port(
        i0, i1 : in  std_logic_vector(2 downto 0);
        s      : in  std_logic;
        o      : out std_logic_vector(2 downto 0)
    );
end Mux2x1_3b;


architecture behav of Mux2x1_3b is

begin
	with s select o <= i0 when '0', i1 when '1';
end architecture behav;


library ieee;
use ieee.std_logic_1164.all;

entity Mux2x1_5b is
    port(
        i0, i1 : in  std_logic_vector(4 downto 0);
        s      : in  std_logic;
        o      : out std_logic_vector(4 downto 0)
    );
end Mux2x1_5b;


architecture behav of Mux2x1_5b is

begin
    o(0) <= (NOT s AND i0(0)) OR
		    (s AND i1(0));
	o(1) <= (NOT s AND i0(1)) OR
		    (s AND i1(1));
	o(2) <= (NOT s AND i0(2)) OR
		    (s AND i1(2));
	o(3) <= (NOT s AND i0(3)) OR
		    (s AND i1(3));
	o(4) <= (NOT s AND i0(4)) OR
		    (s AND i1(4));

end architecture behav;


library ieee;
use ieee.std_logic_1164.all;

entity Mux4x1_3b is
    port(
        i00, i01, i10, i11 : in  std_logic_vector(2 downto 0);
        s0, s1             : in  std_logic;
        o                  : out std_logic_vector(2 downto 0)
    );
end Mux4x1_3b;


architecture behav of Mux4x1_3b is

begin
    o(0) <= (not s1 and not s0 and i00(0)) or
               (not s1 and s0 and i01(0)) or
               (s1 and not s0 and i10(0)) or
               (s1 and s0 and i11(0));
        o(1) <= (not s1 and not s0 and i00(1)) or
               (not s1 and s0 and i01(1)) or
               (s1 and not s0 and i10(1)) or
               (s1 and s0 and i11(1));
        o(2) <= (not s1 and not s0 and i00(2)) or
               (not s1 and s0 and i01(2)) or
               (s1 and not s0 and i10(2)) or
               (s1 and s0 and i11(2));

end architecture behav;


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

begin
    o(0) <= (not s1 and not s0 and i00(0)) or
               (not s1 and s0 and i01(0)) or
               (s1 and not s0 and i10(0)) or
               (s1 and s0 and i11(0));
	o(1) <= (not s1 and not s0 and i00(1)) or
               (not s1 and s0 and i01(1)) or
               (s1 and not s0 and i10(1)) or
               (s1 and s0 and i11(1));
	o(2) <= (not s1 and not s0 and i00(2)) or
               (not s1 and s0 and i01(2)) or
               (s1 and not s0 and i10(2)) or
               (s1 and s0 and i11(2));
	o(3) <= (not s1 and not s0 and i00(3)) or
               (not s1 and s0 and i01(3)) or
               (s1 and not s0 and i10(3)) or
               (s1 and s0 and i11(3));
	o(4) <= (not s1 and not s0 and i00(4)) or
               (not s1 and s0 and i01(4)) or
               (s1 and not s0 and i10(4)) or
               (s1 and s0 and i11(4));
	o(5) <= (not s1 and not s0 and i00(5)) or
               (not s1 and s0 and i01(5)) or
               (s1 and not s0 and i10(5)) or
               (s1 and s0 and i11(5));
	o(6) <= (not s1 and not s0 and i00(6)) or
               (not s1 and s0 and i01(6)) or
               (s1 and not s0 and i10(6)) or
               (s1 and s0 and i11(6));
	o(7) <= (not s1 and not s0 and i00(7)) or
               (not s1 and s0 and i01(7)) or
               (s1 and not s0 and i10(7)) or
               (s1 and s0 and i11(7));
	o(8) <= (not s1 and not s0 and i00(8)) or
               (not s1 and s0 and i01(8)) or
               (s1 and not s0 and i10(8)) or
               (s1 and s0 and i11(8));
	o(9) <= (not s1 and not s0 and i00(9)) or
               (not s1 and s0 and i01(9)) or
               (s1 and not s0 and i10(9)) or
               (s1 and s0 and i11(9));
	o(10) <= (not s1 and not s0 and i00(10)) or
               (not s1 and s0 and i01(10)) or
               (s1 and not s0 and i10(10)) or
               (s1 and s0 and i11(10));
	o(11) <= (not s1 and not s0 and i00(11)) or
               (not s1 and s0 and i01(11)) or
               (s1 and not s0 and i10(11)) or
               (s1 and s0 and i11(11));
	o(12) <= (not s1 and not s0 and i00(12)) or
               (not s1 and s0 and i01(12)) or
               (s1 and not s0 and i10(12)) or
               (s1 and s0 and i11(12));
	o(13) <= (not s1 and not s0 and i00(13)) or
               (not s1 and s0 and i01(13)) or
               (s1 and not s0 and i10(13)) or
               (s1 and s0 and i11(13));
	o(14) <= (not s1 and not s0 and i00(14)) or
               (not s1 and s0 and i01(14)) or
               (s1 and not s0 and i10(14)) or
               (s1 and s0 and i11(14));
	o(15) <= (not s1 and not s0 and i00(15)) or
               (not s1 and s0 and i01(15)) or
               (s1 and not s0 and i10(15)) or
               (s1 and s0 and i11(15));

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

architecture PureLogic of My_Mux8x1_16b is
begin
    o <= (i000 and (15 downto 0 => en and not s2 and not s1 and not s0)) or
         (i001 and (15 downto 0 => en and not s2 and not s1 and s0)) or
         (i010 and (15 downto 0 => en and not s2 and s1 and not s0)) or
         (i011 and (15 downto 0 => en and not s2 and s1 and s0)) or
         (i100 and (15 downto 0 => en and s2 and not s1 and not s0)) or
         (i101 and (15 downto 0 => en and s2 and not s1 and s0)) or
         (i110 and (15 downto 0 => en and s2 and s1 and not s0)) or
         (i111 and (15 downto 0 => en and s2 and s1 and s0));
end PureLogic;

