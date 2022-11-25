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
            inp_0: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_1: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_2: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_3: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_4: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_5: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_6: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            inp_7: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
            out_0: out STD_LOGIC_VECTOR(1 downto 0);
            out_1: out STD_LOGIC_VECTOR(1 downto 0);
            out_2: out STD_LOGIC_VECTOR(1 downto 0);
            out_3: out STD_LOGIC_VECTOR(1 downto 0);
            out_4: out STD_LOGIC_VECTOR(1 downto 0);
            out_5: out STD_LOGIC_VECTOR(1 downto 0);
            out_6: out STD_LOGIC_VECTOR(1 downto 0);
            out_7: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    --Inputs
    signal inp_0: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_1: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_2: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_3: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_4: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_5: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_6: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    signal inp_7: STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
    --Outputs
    signal out_0: STD_LOGIC_VECTOR(1 downto 0);
    signal out_1: STD_LOGIC_VECTOR(1 downto 0);
    signal out_2: STD_LOGIC_VECTOR(1 downto 0);
    signal out_3: STD_LOGIC_VECTOR(1 downto 0);
    signal out_4: STD_LOGIC_VECTOR(1 downto 0);
    signal out_5: STD_LOGIC_VECTOR(1 downto 0);
    signal out_6: STD_LOGIC_VECTOR(1 downto 0);
    signal out_7: STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: switch_omega_network
        port map(
            inp_0 => inp_0,
            inp_1 => inp_1,
            inp_2 => inp_2,
            inp_3 => inp_3,
            inp_4 => inp_4,
            inp_5 => inp_5,
            inp_6 => inp_6,
            inp_7 => inp_7,
            out_0 => out_0,
            out_1 => out_1,
            out_2 => out_2,
            out_3 => out_3,
            out_4 => out_4,
            out_5 => out_5,
            out_6 => out_6,
            out_7 => out_7
        );
    stim_proc: process
    begin
        wait for 10 ns;
        inp_0<="011111";
        inp_1<="010101";
        inp_2<="110000";
        inp_3<="100110";
        inp_4<="011111";
        inp_5<="000010";
        inp_6<="111111";
        inp_7<="010000";
        wait;
    end process;
end Behavioral;
