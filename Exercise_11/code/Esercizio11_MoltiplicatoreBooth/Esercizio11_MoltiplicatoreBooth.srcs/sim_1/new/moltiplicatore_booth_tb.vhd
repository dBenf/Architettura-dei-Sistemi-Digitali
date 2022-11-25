----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 14:38:24
-- Design Name: 
-- Module Name: moltiplicatore_booth_tb - Behavioral
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
use WORK.ALL;

entity moltiplicatore_booth_tb is
end moltiplicatore_booth_tb;

architecture Behavioral of moltiplicatore_booth_tb is
    component moltiplicatore_booth is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            START: in STD_LOGIC;
            in_0: in STD_LOGIC_VECTOR(7 downto 0);
            in_1: in STD_LOGIC_VECTOR(7 downto 0);
            output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    --Inputs
    signal CLK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal START : STD_LOGIC := '0';
    signal in_0 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal in_1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    --Outputs
    signal output: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
    constant CLK_period: time := 10ns;
begin
    uut: entity work.moltiplicatore_booth(Structural)
        port map(
            CLK => CLK,
            RST => RST,
            START => START,
            in_0 => in_0,
            in_1 => in_1,
            output => output
        );
    CLK_process: process
        begin
            CLK <= '0';
            wait for CLK_period/2;
            CLK <= '1';
            wait for CLK_period/2;
        end process;
    stim_proc: process
    begin
        wait for 100ns;
        RST <= '1';
        wait for 50ns;
        RST <= '0';
        wait for 50ns;
        START <= '1';
        in_0 <= "00000101";  -- -123
        in_1 <= "10000101";  -- -123
        wait for 50ns;
        START <= '0';
        wait;
    end process;
end Behavioral;
