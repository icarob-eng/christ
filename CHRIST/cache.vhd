entity Cache is
    port(
        addr       : in BIT_VECTOR(7 downto 1);  -- 2^7 addresses
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        input      : in BIT_VECTOR(16 downto 1);
        output     : out BIT_VECTOR(16 downto 1);
        clk        : in bit
    );
end Cache;

architecture behav of Cache is

begin

end architecture behav;