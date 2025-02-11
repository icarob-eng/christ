library ieee;
use ieee.std_logic_1164.all;

entity Mem is
    port(
        addr       : in std_logic_vector(15 downto 0);  -- 2^16 addresses
        r_en, w_en : in std_logic; -- Read/Write Enable (0 is read)
        input      : in std_logic_vector(15 downto 0);
        output     : out std_logic_vector(15 downto 0);
        clk        : in std_logic
    );
end Mem;

architecture behav of Mem is
	signal selected : std_logic_vector(15 downto 0);
begin
    selection: with addr select selected
		-- <= "0011000000000000" when "0000000000000000", -- first op is NOPE, for simplicity
		-- -- code goes here: "instruction" WHEN "sequential binary"
		<= "0100010100000000" when "0000000000000000",
		"0101010100000000" when "0000000000000001",
		"0100010010000000" when "0000000000000010",
		"1000000010000000" when "0000000000000011",
		"0001011001111100" when "0000000000000100",
		"0100010010000000" when "0000000000000101",
		"1000000010000000" when "0000000000000110",
		"0001010001111110" when "0000000000000111",
		"0100010110000000" when "0000000000001000",
		"0101010110000000" when "0000000000001001",
		"0100010010000000" when "0000000000001010",
		"1000000010000000" when "0000000000001011",
		"0001011001111100" when "0000000000001100",
		"0100010010000000" when "0000000000001101",
		"1000000010000000" when "0000000000001110",
		"0001010001111110" when "0000000000001111",
		"1000011000100110" when "0000000000010000",
		"0101011000000000" when "0000000000010001",
		"0100010010000000" when "0000000000010010",
		"1000000010000000" when "0000000000010011",
		"0001011001111110" when "0000000000010100",
		"0100010010000000" when "0000000000010101",
		"1000000010000000" when "0000000000010110",
		"0001010001111110" when "0000000000010111",
		"0000011111101000" when "0000000000011000",
		-- code ends here.
		"0000000000000000" when others;  -- if invalid address, halts]

    with r_en select output <= "0000000000000000" when '0',
	                            selected           when '1';
	
end architecture behav;
