----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 12:22:06
-- Design Name: 
-- Module Name: switch_omega_handshaking_tb - Behavioral
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

entity switch_omega_handshaking_tb is
end switch_omega_handshaking_tb;

architecture Behavioral of switch_omega_handshaking_tb is
    component switch_omega_handshaking is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            inp_0: in STD_LOGIC_VECTOR(3 downto 0);
            inp_1: in STD_LOGIC_VECTOR(3 downto 0);
            inp_2: in STD_LOGIC_VECTOR(3 downto 0);
            inp_3: in STD_LOGIC_VECTOR(3 downto 0);
            en_0: in STD_LOGIC;
            en_1: in STD_LOGIC;
            en_2: in STD_LOGIC;
            en_3: in STD_LOGIC;
            out_0: out STD_LOGIC_VECTOR(1 downto 0);
            out_1: out STD_LOGIC_VECTOR(1 downto 0);
            out_2: out STD_LOGIC_VECTOR(1 downto 0);
            out_3: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    
    --Inputs
    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    signal Input0 : std_logic_vector(3 downto 0) := (others => '0');
    signal Input1 : std_logic_vector(3 downto 0) := (others => '0');
    signal Input2 : std_logic_vector(3 downto 0) := (others => '0');
    signal Input3 : std_logic_vector(3 downto 0) := (others => '0');
    signal En0 : std_logic := '0';
    signal En1 : std_logic := '0';
    signal En2 : std_logic := '0';
    signal En3 : std_logic := '0';
    
    --Outputs
    signal Output0 : std_logic_vector(1 downto 0);
    signal Output1 : std_logic_vector(1 downto 0);
    signal Output2 : std_logic_vector(1 downto 0);
    signal Output3 : std_logic_vector(1 downto 0);
    
    --Clock period definitions
    constant CLK_period: time := 10ns;
begin
    uut: switch_omega_handshaking
        port map (
            CLK => CLK,
            RST => RST,
            inp_0 => Input0,
            inp_1 => Input1,
            inp_2 => Input2,
            inp_3 => Input3,
            en_0 => En0,
            en_1 => En1,
            en_2 => En2,
            en_3 => En3,
            out_0 => Output0,
            out_1 => Output1,
            out_2 => Output2,
            out_3 => Output3
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
            Input3 <= "0001"; --Switch 3 invia a switch 0 il dato "01"
            Input1 <= "1000"; --Switch 1 invia allo switch 2 il dato "00"
            wait for CLK_period;
            En3 <= '1';
            En1 <= '1';
            wait for 10*CLK_period;
            Input2 <= "1111"; --Switch 2 invia allo switch 3 il dato "11"
            Input0 <= "0110"; --Switch 0 invia allo switch 1 il dato "10"
            wait for CLK_period;
            En0 <= '1';
            En2 <= '1';
            wait for 10*CLK_period;
            En0 <= '0';
            En1 <= '0';
            En2 <= '0';
            En3 <= '0';
            wait;
        end process;
end Behavioral;
