library ieee;
use ieee.std_logic_1164.all;

entity Adder_16b is
    port(
        a, b : in std_logic_vector(15 downto 0);
        cin  : in std_logic;
        s    : out std_logic_vector(15 downto 0);
        cout : out std_logic
    );
end Adder_16b;

architecture behav of Adder_16b is

begin

end architecture behav;
