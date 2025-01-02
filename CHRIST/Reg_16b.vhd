entity Reg_16b is
    port(
        input    : in BIT_VECTOR(16 downto 1);
        output   : out BIT_VECTOR(16 downto 1);
        write_en : in bit;
        clk      : in bit
    );
end Reg_16b;

architecture behav of Reg_16b is

begin

end architecture behav;
