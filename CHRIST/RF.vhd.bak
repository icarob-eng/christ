entity RF is
    port(
        w_addr, r_a_addr, r_b_addr : in BIT_VECTOR(2 downto 0);
        input                                : in BIT_VECTOR(15 downto 0);
        a_out, b_out                         : out BIT_VECTOR(15 downto 0);
        clk                                  : in bit
    );
end RF;

architecture Behavioral of RF is
    type RegisterArray is array (0 to 7) of BIT_VECTOR(15 downto 0); -- 8 registradores de 16 bits
    signal Registers : RegisterArray := (others => (others => '0')); -- Inicialização para 0
begin
    -- Escrita no arquivo de registradores
    process(clk)
    begin
        if rising_edge(clk) then
            if write_en = '1' and write_addr /= "000" then -- Ignorar escrita no reg(0)
                Registers(to_integer(unsigned(write_addr))) <= write_data;
        end if;
    end process;

    -- Leituras simultâneas
    process(read_addr_A, read_addr_B, Registers)
    begin
        -- Leitura do registrador A
        if read_addr_A = "000" then
            READ_A <= (others => '0'); -- Registrador 0 sempre retorna 0
        else
            READ_A <= Registers(to_integer(unsigned(read_addr_A)));
        end if;

        -- Leitura do registrador B
        if read_addr_B = "000" then
            READ_B <= (others => '0'); -- Registrador 0 sempre retorna 0
        else
            READ_B <= Registers(to_integer(unsigned(read_addr_B)));
        end if;
    end process;
end Behavioral;
