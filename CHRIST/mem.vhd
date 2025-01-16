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
	signal selected : BIT_VECTOR(15 downto 0);
begin
    selection: with addr select selected
<= "0011000000000000" when "0000000000000000", -- first op is NOPE, for simplicity
-- -- code goes here: "instruction" WHEN "sequential binary"
"0100010100110000" when "0000000000000001",
"0100010100110000" when "0000000000000010",
"0100010100110000" when "0000000000000011",
-- code ends here.
"0000000000000000" when others;  -- if invalid address, halts]

    with r_en select output <= "0000000000000000" when '0',
	                            selected           when '1';
	
end architecture behav;
