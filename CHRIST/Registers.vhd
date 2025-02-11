library ieee;
use ieee.std_logic_1164.all;

entity Reg_1b is -- D flip-flop
    port(
        input, write_en, clk : in  std_logic;
        output               : out std_logic
    );
end Reg_1b;


architecture behav of Reg_1b is

begin
    process(clk)
	begin
		if (clk ' event and clk = '1') then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;

end architecture behav;


library ieee;
use ieee.std_logic_1164.all;

entity Reg_3b is
    port(
        input    : in std_logic_vector(2 downto 0);
        output   : out std_logic_vector(2 downto 0);
        write_en : in std_logic;
        clk      : in std_logic
    );
end Reg_3b;

architecture behav of Reg_3b is

begin
	process(clk)
	begin
		if (clk ' event and clk = '1') then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;

end architecture behav;


library ieee;
use ieee.std_logic_1164.all;

entity Reg_8b is
    port(
        input    : in std_logic_vector(7 downto 0);
        output   : out std_logic_vector(7 downto 0);
        write_en : in std_logic;
        clk      : in std_logic
    );
end Reg_8b;

architecture behav of Reg_8b is

begin
	process(clk)
	begin
		if (clk ' event and clk = '1') then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;

end architecture behav;



library ieee;
use ieee.std_logic_1164.all;

entity Reg_16b is
    port(
        input    : in std_logic_vector(15 downto 0);
        output   : out std_logic_vector(15 downto 0);
        write_en : in std_logic;
        clk      : in std_logic
    );
end Reg_16b;

architecture behav of Reg_16b is

begin
    process(clk)
	begin
		if (clk ' event and clk = '1') then
			if write_en = '1' then
				output <= input;
			end if;
		end if;
	end process;

end architecture behav;
