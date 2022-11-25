----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 12:18:04
-- Design Name: 
-- Module Name: riconoscitore_tb - Behavioral
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

entity riconoscitore_tb is
end riconoscitore_tb;

architecture Behavioral of riconoscitore_tb is
    component riconoscitore_beh is
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
    uut: riconoscitore_beh port
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
            
            --uscita alta
            x <= '1';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            assert y ='1';
            
            x <= '1';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            assert y ='1';
            
            --uscita bassa
            --001
            x <= '0';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '1';
            assert y ='1';
            
            --011
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '1';
            assert y ='1';
            
            --010
            x <= '0';
            wait for clk_per;
            x <= '1';
            wait for clk_per;
            x <= '0';
            assert y ='1';
            
            --000
            x <= '0';
            wait for clk_per;
            x <= '0';
            wait for clk_per;
            x <= '0';
            assert y ='1';
    end process;
end Behavioral;
