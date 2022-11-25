----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2022 18:11:18
-- Design Name: 
-- Module Name: booth_multiplier_tb - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_multiplier_tb is
end booth_multiplier_tb;

architecture Behavioral of booth_multiplier_tb is

    component booth_multiplier is
        generic (
            x : integer := 8; --numero di bit di m
            y : integer := 8); --numero di bit di r

        Port(clock : in std_logic;
             reset : in std_logic;
             start : in std_logic;
             m : in std_logic_vector(x - 1 downto 0);
             r : in std_logic_vector(y - 1 downto 0);
             result : out std_logic_vector(x + y - 1 downto 0);
             stop : out std_logic);

    end component;

    signal m : std_logic_vector(2 downto 0) := (others=>'0');
    signal r : std_logic_vector(2 downto 0) := (others=>'0');
    signal result : std_logic_vector(5 downto 0) := (others=>'0');
    signal stop : std_logic := '0';
    signal start :std_logic:= '0';
    signal clock : std_logic;
    signal reset : std_logic := '0';
    constant clk_per : time := 10 ns;

begin

    uut : booth_multiplier generic map(3,3)
        port map(
            clock => clock,
            reset => reset,
            start => start,
            m => m,
            r => r,
            result => result,
            stop => stop);

    clk: process
    begin
        clock <= '0';
        wait for clk_per;
        clock <= '1';
        wait for clk_per;
    end process;

    test: process
    begin
        m <= "010";
        r <= "100";
        wait for clk_per;
        start <= '1';
        wait for clk_per;
        
        m <= "011";
        r <= "010";
        wait for clk_per;
        start <= '1';
        wait for clk_per;
        
        m <= "110";
        r <= "101";
        wait for clk_per;
        start <= '1';
        wait for clk_per;
        
        m <= "000";
        r <= "000";
        wait for clk_per;
        start <= '1';
        wait;
    end process;
end Behavioral;
