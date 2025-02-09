entity Cache is
    port(
        addr       : in BIT_VECTOR(6 downto 0);  -- 2^7 addresses
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        input      : in BIT_VECTOR(15 downto 0);
        output     : out BIT_VECTOR(15 downto 0);
        clk        : in bit
    );
end Cache;

architecture behav of Cache is

begin

end architecture behav;
