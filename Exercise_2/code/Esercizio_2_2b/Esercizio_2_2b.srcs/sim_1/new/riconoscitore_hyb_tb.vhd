----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 18:34:18
-- Design Name: 
-- Module Name: riconoscitore_hyb_tb - Behavioral
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

entity riconoscitore_hyb_tb is
end riconoscitore_hyb_tb;

architecture Behavioral of riconoscitore_hyb_tb is
    component riconoscitore_hyb is
        Port( i : in std_logic;
             clock : in std_logic;
             y : out std_logic;
             reset : in std_logic
            );
    end component;

    signal x : std_logic := '0';
    signal y : std_logic := '0';
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';

    constant clk_per : time := 10 ns;


begin
    uut: riconoscitore_hyb port
        map (
            i=> x,
            clock => clock,
            reset => reset,
            y => y
        );

    clk_process : process
    begin
        clock <= '0';
        wait for clk_per/2;
        clock <= '1';
        wait for clk_per/2;
    end process;
    
    process1 : process
        begin
            reset <= '1';
            wait for 20 ns;
            reset <= '0';
            
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '0';
    end process;
end Behavioral;
