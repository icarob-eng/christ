library ieee;
use ieee.std_logic_1164.all;

entity Cache is
    port(
        addr   : in std_logic_vector(6 downto 0);  -- 2^7 addresses
        w_en   : in std_logic; -- Read/Write Enable (0 is read)
        input  : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0);
        clk    : in std_logic
    );
end Cache;

architecture behav of Cache is

begin

end architecture behav;
