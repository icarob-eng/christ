entity Mem is
    port(
        addr       : in BIT_VECTOR(15 downto 0);  -- 2^16 addresses
        r_en, w_en : in bit; -- Read/Write Enable (0 is read)
        input      : in BIT_VECTOR(15 downto 0);
        output     : out BIT_VECTOR(15 downto 0);
        clk        : in bit
    );
end Mem;

architecture behav of Mem is

begin

end architecture behav;
