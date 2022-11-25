----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 17:29:12
-- Design Name: 
-- Module Name: switch_omega_network_tb - Behavioral
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

entity switch_omega_network_tb is
end switch_omega_network_tb;

architecture Behavioral of switch_omega_network_tb is
    component switch_omega_network is
        Port (
            en_in_0: in STD_LOGIC;
            en_in_1: in STD_LOGIC;
            en_in_2: in STD_LOGIC;
            en_in_3: in STD_LOGIC;
            destination_in_0: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_1: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_2: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_3: in STD_LOGIC_VECTOR(1 downto 0);
            inp_0: in STD_LOGIC_VECTOR(1 downto 0);
            inp_1: in STD_LOGIC_VECTOR(1 downto 0);
            inp_2: in STD_LOGIC_VECTOR(1 downto 0);
            inp_3: in STD_LOGIC_VECTOR(1 downto 0);
            out_0: out STD_LOGIC_VECTOR(1 downto 0);
            out_1: out STD_LOGIC_VECTOR(1 downto 0);
            out_2: out STD_LOGIC_VECTOR(1 downto 0);
            out_3: out STD_LOGIC_VECTOR(1 downto 0)
            
        );
    end component;
    --Inputs
    signal en_in_0: STD_LOGIC := '0';
    signal en_in_1: STD_LOGIC := '0';
    signal en_in_2: STD_LOGIC := '0';
    signal en_in_3: STD_LOGIC := '0';
    signal destination_in_0: STD_LOGIC_VECTOR(1 downto 0);
    signal destination_in_1: STD_LOGIC_VECTOR(1 downto 0);
    signal destination_in_2: STD_LOGIC_VECTOR(1 downto 0);
    signal destination_in_3: STD_LOGIC_VECTOR(1 downto 0);
    signal inp_0: STD_LOGIC_VECTOR(1 downto 0);
    signal inp_1: STD_LOGIC_VECTOR(1 downto 0);
    signal inp_2: STD_LOGIC_VECTOR(1 downto 0);
    signal inp_3: STD_LOGIC_VECTOR(1 downto 0);
    --Outputs
    signal out_0: STD_LOGIC_VECTOR(1 downto 0);
    signal out_1: STD_LOGIC_VECTOR(1 downto 0);
    signal out_2: STD_LOGIC_VECTOR(1 downto 0);
    signal out_3: STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: entity work.switch_omega_network(Structural)
        port map(
            en_in_0 => en_in_0,
            en_in_1 => en_in_1,
            en_in_2 => en_in_2,
            en_in_3 => en_in_3,
            destination_in_0 => destination_in_0,
            destination_in_1 => destination_in_1,
            destination_in_2 => destination_in_2,
            destination_in_3 => destination_in_3,
            inp_0 => inp_0,
            inp_1 => inp_1,
            inp_2 => inp_2,
            inp_3 => inp_3,
            out_0 => out_0,
            out_1 => out_1,
            out_2 => out_2,
            out_3 => out_3
        );
    stim_proc: process
    begin
        wait for 10ns;
        inp_0 <= "10";
        inp_1 <= "11";
        inp_2 <= "11";
        inp_3 <= "00";
        en_in_0 <= '1';
        en_in_1 <= '1';
        en_in_2 <= '1';
        en_in_3 <= '1';
        destination_in_0 <= "01";
        destination_in_1 <= "11";
        destination_in_2 <= "00";
        destination_in_3 <= "10";
        wait for 10ns;
        en_in_0 <= '0';
        wait for 10ns;
        en_in_1 <= '0';
        wait for 10ns;
        en_in_2 <= '0';
        wait;
    end process;
end Behavioral;
