----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 12:49:48
-- Design Name: 
-- Module Name: ffT_reset - Behavioral
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffD_reset is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC; -- Renamed from preset, now acts as reset to '0'
           ce : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end ffD_reset;

architecture Behavioral of ffD_reset is
begin
process (clk, reset)
begin
    -- Asynchronous reset: if reset is '1', force q to '0'
    if reset='1' then
        q <= '0'; -- <-- CAMBIO: Ahora resetea a '0'
    elsif (clk'event and clk='1') then -- Synchronous part on rising clock edge
        if ce = '1' then -- Only update on clock enable
            q <= d;
        end if;
    end if;
end process;
end Behavioral;
