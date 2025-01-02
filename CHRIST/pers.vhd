entity PERS is  -- periferals module. TODO: add external connections
    port(
        addr       : in BIT_VECTOR(3 downto 1);  -- 2^3 periferals
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        input      : in BIT_VECTOR(16 downto 1);
        output     : out BIT_VECTOR(16 downto 1);
        clk        : in bit
    );
end PERS;

architecture behav of PERS is

begin

end architecture behav;
