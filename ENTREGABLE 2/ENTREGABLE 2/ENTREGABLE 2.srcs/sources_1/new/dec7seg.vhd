library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec7seg is
    Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (6 downto 0));
end dec7seg;

architecture Behavioral of dec7seg is
begin
    process (bcd)
    begin
        case bcd is
            when "0000" => led <= "1111110"; -- 0
            when "0001" => led <= "0110000"; -- 1
            when "0010" => led <= "1101101"; -- 2
            when "0011" => led <= "1111001"; -- 3
            when "0100" => led <= "0110011"; -- 4
            when "0101" => led <= "1011011"; -- 5
            when "0110" => led <= "1011111"; -- 6
            when "0111" => led <= "1110000"; -- 7
            when "1000" => led <= "1111111"; -- 8
            when "1001" => led <= "1111011"; -- 9
            when others => led <= "0000000"; -- Para entradas inválidas (opcional)
        end case;
    end process;
end Behavioral;