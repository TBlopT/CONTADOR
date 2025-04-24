----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 13:49:31
-- Design Name: 
-- Module Name: sistema_tb - Behavioral
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

entity sistema_tb is
-- Port ( );
end sistema_tb;

architecture Behavioral of sistema_tb is

component top_module

port( clk   : std_logic;
      ce    : std_logic;
      reset : std_logic;
      count : std_logic_vector (3 downto 0);
      segment_outputs : out STD_LOGIC_VECTOR (6 downto 0)); -- ***RENOMBRADO***

end component;

 signal clk   : std_logic := '0';
    signal ce    : std_logic := '0';
    signal reset : std_logic := '0';
    signal count_tb : std_logic_vector (3 downto 0);  -- Señal para observar la salida del contador
    signal segment_outputs_tb : std_logic_vector (6 downto 0);  -- Señal para observar la salida del decodificador

begin
  dut: top_module
    port map ( clk   => clk,
               ce    => ce,
               reset => reset,
               count => count_tb,
               segment_outputs => segment_outputs_tb);

  -- Clock generation
  clk <= not clk after 5 ns;

  stimuli : process
  begin
-- Asynchronous reset initialization is needed
  reset <= '1'; -- Inicializamos reset a '1' para el pulso inicial
  ce <= '0';

  wait for 20 ns;
  reset <= '0'; -- Fin del pulso de reset inicial

  wait for 20 ns; -- Esperamos hasta el tiempo 40 ns
  ce <= '1';    -- Activamos ce después de 20 ns del fin del reset

  wait for 140 ns; -- Esperamos hasta el tiempo 180 ns (20 + 20 + 140)
  reset <= '1'; -- Volvemos a activar el reset a los 180 ns

  wait for 20 ns; -- Mantenemos el reset activo durante un tiempo
  reset <= '0'; -- Desactivamos el segundo pulso de reset
  end process;

end Behavioral;
