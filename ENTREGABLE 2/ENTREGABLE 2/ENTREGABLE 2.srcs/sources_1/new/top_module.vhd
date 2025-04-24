----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 14:29:47
-- Design Name: 
-- Module Name: top_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk   : in  STD_LOGIC;
           ce    : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : std_logic_vector (3 downto 0);
           segment_outputs : out STD_LOGIC_VECTOR (6 downto 0) -- Conexión al display
           );
end top_module;

architecture Behavioral of top_module is

    -- Componente del contador
    COMPONENT contador177
        PORT(
            clk : IN  STD_LOGIC;
            ce  : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            count : OUT STD_LOGIC_VECTOR (3 downto 0)
        );
    END COMPONENT;

    -- Componente del decodificador 7 segmentos
    COMPONENT dec7seg
        PORT(
            bcd : IN  STD_LOGIC_VECTOR (3 downto 0);
            led : OUT STD_LOGIC_VECTOR (6 downto 0)
        );
    END COMPONENT;

    signal count_internal : STD_LOGIC_VECTOR (3 downto 0);
    signal led_internal   : STD_LOGIC_VECTOR (6 downto 0);

begin

    -- Instancia del contador
    inst_contador: contador177
        PORT MAP(
            clk   => clk,
            ce    => ce,
            reset => reset,
            count => count_internal
        );

    -- Instancia del decodificador 7 segmentos
    inst_dec7seg: dec7seg
        PORT MAP(
            bcd => count_internal,
            led => led_internal
        );

    -- Conexión de la salida del decodificador a los puertos de salida del módulo superior
  segment_outputs <= led_internal;

end Behavioral;