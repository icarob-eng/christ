entity Reg_16b is
    port(
        input    : in BIT_VECTOR(15 downto 0);
        output   : out BIT_VECTOR(15 downto 0);
        write_en : in bit;
        clk      : in bit
    );
end Reg_16b;

architecture behav of Reg_16b is

begin

end architecture behav;
