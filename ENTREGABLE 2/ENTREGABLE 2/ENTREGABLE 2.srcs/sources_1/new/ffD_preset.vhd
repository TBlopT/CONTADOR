----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 12:50:56
-- Design Name: 
-- Module Name: ffD_preset - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffD_preset is
    Port ( clk : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end ffD_preset;

architecture Behavioral of ffD_preset is
begin
process (clk, preset)
begin
    if preset='1' then
        q <= '1';
    elsif (clk'event and clk='1') then
        if ce = '1' then
            q <= d;
        end if;
    end if;
end process;
end Behavioral;

