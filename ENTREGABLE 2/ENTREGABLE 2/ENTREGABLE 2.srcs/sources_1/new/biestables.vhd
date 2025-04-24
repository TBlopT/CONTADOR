----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 12:26:33
-- Design Name: 
-- Module Name: biestables - Behavioral
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

entity contador229 is
    Port ( clk    : in  STD_LOGIC;
           ce     : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           count  : out  STD_LOGIC_VECTOR (3 downto 0));
end contador229;
architecture behavioral of contador229 is

    COMPONENT ffd_reset
        PORT(
            clk : IN std_logic;
            ce  : IN std_logic;
            d   : IN std_logic;
            q   : OUT std_logic
        );
    END COMPONENT;

    COMPONENT ftt_preset
        PORT(
            clk    : IN std_logic;
            ce     : IN std_logic;
            preset : IN std_logic;
            t      : IN std_logic;
            q      : OUT std_logic
        );
    END COMPONENT;

    signal qa, qb, qc, qd : std_logic;
    signal ta, tb, tc, td : std_logic;

begin

    unitA: ftr_preset PORT MAP(
        clk    => clk,
        ce     => ce,
        preset => reset,
        t      => ta,
        q      => qa
    );

    unitB: ffd_reset PORT MAP(
        clk => clk,
        ce  => ce,
        d   => qb,
        q   => qb
    );

    unitC: ftt_preset PORT MAP(
        clk    => clk,
        ce     => ce,
        preset => reset,
        t      => ta,
        q      => qa
    );
        unitD: ffd_reset PORT MAP(
        clk => clk,
        ce  => ce,
        d   => qc,
        q   => qc
    );

end Behavioral;
