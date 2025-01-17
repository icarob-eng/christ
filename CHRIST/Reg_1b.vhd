entity Reg_1b is -- D flip-flop
    port(
        input, write_en, clk : in  bit;
        output               : out bit
    );
end Reg_1b;


architecture behav of Reg_1b is

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;
end architecture behav;
