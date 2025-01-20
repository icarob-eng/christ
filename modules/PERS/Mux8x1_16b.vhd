entity My_Mux8x1_16b is
    port(
        i000, i001, i010, i011, i100, i101, i110, i111 : in  BIT_VECTOR(15 downto 0);
        en                                             : in  bit;
        s0, s1, s2                                     : in  bit;
        o                                              : out BIT_VECTOR(15 downto 0)
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

