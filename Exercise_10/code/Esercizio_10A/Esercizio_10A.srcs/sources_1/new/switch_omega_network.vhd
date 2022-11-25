----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 17:02:01
-- Design Name: 
-- Module Name: switch_omega_network - Structural
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

entity switch_omega_network is
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
end switch_omega_network;

architecture Structural of switch_omega_network is
    component unita_controllo is
        Port (
            en_in_0: in STD_LOGIC;
            en_in_1: in STD_LOGIC;
            en_in_2: in STD_LOGIC;
            en_in_3: in STD_LOGIC;
            destination_in_0: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_1: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_2: in STD_LOGIC_VECTOR(1 downto 0);
            destination_in_3: in STD_LOGIC_VECTOR(1 downto 0);
            source_addr: out STD_LOGIC_VECTOR(1 downto 0);
            destination_addr: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    component switch_4_4 is
        Port (
            inp_0: in STD_LOGIC_VECTOR(1 downto 0);
            inp_1: in STD_LOGIC_VECTOR(1 downto 0);
            inp_2: in STD_LOGIC_VECTOR(1 downto 0);
            inp_3: in STD_LOGIC_VECTOR(1 downto 0);
            source_add: in STD_LOGIC_VECTOR(1 downto 0);
            destination_add: in STD_LOGIC_VECTOR(1 downto 0);
            out_1: out STD_LOGIC_VECTOR(1 downto 0);
            out_2: out STD_LOGIC_VECTOR(1 downto 0);
            out_3: out STD_LOGIC_VECTOR(1 downto 0);
            out_4: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    signal k0: STD_LOGIC_VECTOR(1 downto 0);
    signal k1: STD_LOGIC_VECTOR(1 downto 0);
begin
    unita_di_controllo: unita_controllo
        port map (
            en_in_0 => en_in_0,
            en_in_1 => en_in_1,
            en_in_2 => en_in_2,
            en_in_3 => en_in_3,
            destination_in_0 => destination_in_0,
            destination_in_1 => destination_in_1,
            destination_in_2 => destination_in_2,
            destination_in_3 => destination_in_3,
            source_addr => k0,
            destination_addr => k1
        );
    unita_operativa: switch_4_4
        port map (
            inp_0 => inp_0,
            inp_1 => inp_1,
            inp_2 => inp_2,
            inp_3 => inp_3,
            source_add => k0,
            destination_add => k1,
            out_1 => out_0,
            out_2 => out_1,
            out_3 => out_2,
            out_4 => out_3
        );
end Structural;
