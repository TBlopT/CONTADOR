----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 21.04.2025 12:54:17
-- Design Name:
-- Module Name: contador177 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:    Improved custom 4-bit counter logic (removed redundant term)
--
-- Dependencies:   Requires ffD_preset and ffT_reset components
--
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Simplified td logic
-- Additional Comments:
--   Note: This implements a custom counting sequence defined by the logic,
--   not a standard binary or BCD counter. The name '177' is not indicative
--   of the 4-bit count range (0-15).
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador177 is
    Port ( clk : in     STD_LOGIC;
           ce : in      STD_LOGIC;
           reset : in   STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0));
end contador177;

architecture Behavioral of contador177 is

    -- Component declarations (assuming these are defined elsewhere and available)
    COMPONENT ffD_preset
        PORT(
             clk : IN std_logic;
             ce : IN std_logic;
             preset : IN std_logic; -- Assuming this acts as an asynchronous reset to '0'
             d : IN std_logic;
             q : OUT std_logic
            );
    END COMPONENT;

    COMPONENT ffT_reset
        PORT(
             clk : IN std_logic;
             ce : IN std_logic;
             reset : IN std_logic; -- Assuming this acts as an asynchronous reset to '0'
             t : IN std_logic;
             q : OUT std_logic
            );
    END COMPONENT;

    -- Internal signals for flip-flop states (qa=LSB, qd=MSB)
    signal qa, qb, qc, qd : std_logic;
    -- Internal signals for flip-flop inputs (da for D-FF, tb for T-FF)
    signal da, tb, dc, td : std_logic;

begin

    -- Instantiate Flip-flops
    unitA: ffD_preset PORT MAP(
        clk => clk,
        ce => ce,
        preset => reset, -- Connecting reset signal to the preset input (assuming preset clears to 0)
        d => da,
        q => qa          -- LSB
    );

    unitB: ffT_reset PORT MAP(
        clk => clk,
        ce => ce,
        reset => reset,
        t => tb,
        q => qb
    );

    unitC: ffD_preset PORT MAP(
        clk => clk,
        ce => ce,
        preset => reset, -- Connecting reset signal to the preset input (assuming preset clears to 0)
        d => dc,
        q => qc
    );

    unitD: ffT_reset PORT MAP(
        clk => clk,
        ce => ce,
        reset => reset,
        t => td,
        q => qd          -- MSB
    );

    -- Combinational logic defining the next state (counter sequence)
    -- Q_a(next) = D_a
    da <= (not qa) and (not qb) and (not qc);
    -- T_b
    tb <= (qa and qb) or (not qb and qd) or ((not qa) and qb and qc);
    -- Q_c(next) = D_c
    dc <= (qa or qb) and ((not qb) or qd) and ((not qa) or qb or (not qd));
    -- T_d - Removed the redundant term (qb and (not qc) and qc) which was always '0'
    td <= (not qd) or (qa and qd) or ((not qa) and (not qb) and qc); -- SIMPLIFICADO

    -- Assign internal state to the output port
    count <= qa & qb & qc & qd; -- MSB to LSB

end Behavioral;