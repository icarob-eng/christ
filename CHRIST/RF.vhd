library ieee;
use ieee.std_logic_1164.all;

entity RF is
    port(
        w_addr, r_a_addr, r_b_addr : in std_logic_vector(2 downto 0);
        input                                : in std_logic_vector(15 downto 0);
        a_out, b_out                         : out std_logic_vector(15 downto 0);
        clk                                  : in std_logic
    );
end RF;

architecture Behavioral of RF is
    type RegisterArray is array (0 to 7) of std_logic_vector(15 downto 0); -- 8 registradores de 16 bits
    signal Registers : RegisterArray := (others => (others => '0')); -- Inicialização para 0
	 
begin
    -- Escrita no arquivo de registradores
    process(clk)
    begin
        if (clk ' event and clk = '1') then
            case w_addr is
					when "001" => Registers(1) <= input;
					when "010" => Registers(2) <= input;
					when "011" => Registers(3) <= input;
					when "100" => Registers(4) <= input;
					when "101" => Registers(5) <= input;
					when "110" => Registers(6) <= input;
					when "111" => Registers(7) <= input;
					when others => Registers(0) <= "0000000000000000";
				end case;
        end if;
    end process;

    -- Leituras simultâneas
    process(r_a_addr, r_b_addr, Registers)
    begin
		case r_a_addr is
			when "001" => a_out <= Registers(1);
			when "010" => a_out <= Registers(2);
			when "011" => a_out <= Registers(3);
			when "100" => a_out <= Registers(4);
			when "101" => a_out <= Registers(5);
			when "110" => a_out <= Registers(6);
			when "111" => a_out <= Registers(7);
			when others => a_out <= Registers(0);
		end case;
		
		case r_b_addr is
			when "001" => b_out <= Registers(1);
			when "010" => b_out <= Registers(2);
			when "011" => b_out <= Registers(3);
			when "100" => b_out <= Registers(4);
			when "101" => b_out <= Registers(5);
			when "110" => b_out <= Registers(6);
			when "111" => b_out <= Registers(7);
			when others => b_out <= Registers(0);
		end case;
	end process;
	
end Behavioral;
