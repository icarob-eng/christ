entity PERS is  -- periferals module. TODO: add external connections
    port(
        addr       : in BIT_VECTOR(2 downto 0);  -- 2^3 periferals
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        input      : in BIT_VECTOR(15 downto 0);
        output     : out BIT_VECTOR(15 downto 0);
        clk        : in bit
    );
end PERS;

architecture behav of PERS is

begin

end architecture behav;
