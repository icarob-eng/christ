entity Reg_8b is
port (
	input    : in  BIT_VECTOR(7 downto 0);
	output   : out BIT_VECTOR(7 downto 0);
	write_en : in  bit;
	clk      : in  bit
);
end Reg_8b;

architecture behav of Reg_8b is
begin
	process(clk)
	begin
		if clk'event and clk='1' then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;
end behav;