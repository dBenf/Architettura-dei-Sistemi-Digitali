----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 10:38:37
-- Design Name: 
-- Module Name: switch_omega_handshaking - Behavioral
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

entity switch_omega_handshaking is
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
end switch_omega_handshaking;

architecture Structural of switch_omega_handshaking is
    component gestore_handshaking is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            SRC: in STD_LOGIC_VECTOR(1 downto 0);
            MEX: in STD_LOGIC_VECTOR(3 downto 0);
            EN: in STD_LOGIC;
            RX: in STD_LOGIC_VECTOR(7 downto 0);
            TX_EN: out STD_LOGIC;
            TX: out STD_LOGIC_VECTOR(7 downto 0);
            dato_ricevuto: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    
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
            inp_0: in STD_LOGIC_VECTOR(7 downto 0);
            inp_1: in STD_LOGIC_VECTOR(7 downto 0);
            inp_2: in STD_LOGIC_VECTOR(7 downto 0);
            inp_3: in STD_LOGIC_VECTOR(7 downto 0);
            out_0: out STD_LOGIC_VECTOR(7 downto 0);
            out_1: out STD_LOGIC_VECTOR(7 downto 0);
            out_2: out STD_LOGIC_VECTOR(7 downto 0);
            out_3: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal TX_OK_0: STD_LOGIC;
    signal TX_OK_1: STD_LOGIC;
    signal TX_OK_2: STD_LOGIC;
    signal TX_OK_3: STD_LOGIC;
    signal TX_0: STD_LOGIC_VECTOR(7 downto 0);
    signal TX_1: STD_LOGIC_VECTOR(7 downto 0);
    signal TX_2: STD_LOGIC_VECTOR(7 downto 0);
    signal TX_3: STD_LOGIC_VECTOR(7 downto 0);
    signal RX_0: STD_LOGIC_VECTOR(7 downto 0);
    signal RX_1: STD_LOGIC_VECTOR(7 downto 0);
    signal RX_2: STD_LOGIC_VECTOR(7 downto 0);
    signal RX_3: STD_LOGIC_VECTOR(7 downto 0);
    
    signal dest0 : std_logic_vector(1 downto 0);
    signal dest1 : std_logic_vector(1 downto 0);
    signal dest2 : std_logic_vector(1 downto 0);
    signal dest3 : std_logic_vector(1 downto 0);
begin
    dest0 <= inp_0(3 downto 2);
    dest1 <= inp_1(3 downto 2);
    dest2 <= inp_2(3 downto 2);
    dest3 <= inp_3(3 downto 2);
    
    gestore_switch_0: gestore_handshaking
        port map(
            CLK => CLK,
            RST => RST,
            SRC => "00",
            MEX => inp_0,
            EN => EN_0,
            RX => RX_0,
            TX_en => TX_OK_0,
            TX => TX_0,
            dato_ricevuto => out_0
        );
    gestore_switch_1: gestore_handshaking
        port map(
            CLK => CLK,
            RST => RST,
            SRC => "01",
            MEX => inp_1,
            EN => EN_1,
            RX => RX_1,
            TX_en => TX_OK_1,
            TX => TX_1,
            dato_ricevuto => out_1
        );
    gestore_switch_2: gestore_handshaking
        port map(
            CLK => CLK,
            RST => RST,
            SRC => "10",
            MEX => inp_2,
            EN => EN_2,
            RX => RX_2,
            TX_en => TX_OK_2,
            TX => TX_2,
            dato_ricevuto => out_2
        );
    gestore_switch_3: gestore_handshaking
        port map(
            CLK => CLK,
            RST => RST,
            SRC => "11",
            MEX => inp_3,
            EN => EN_3,
            RX => RX_3,
            TX_en => TX_OK_3,
            TX => TX_3,
            dato_ricevuto => out_3
        );
    omega: switch_omega_network
        port map(
            en_in_0 => TX_OK_0,
            en_in_1 => TX_OK_1,
            en_in_2 => TX_OK_2,
            en_in_3 => TX_OK_3,
            destination_in_0 => dest0,
            destination_in_1 => dest1,
            destination_in_2 => dest2,
            destination_in_3 => dest3,
            inp_0 => TX_0,
            inp_1 => TX_1,
            inp_2 => TX_2,
            inp_3 => TX_3,
            out_0 => RX_0,
            out_1 => RX_1,
            out_2 => RX_2,
            out_3 => RX_3
        );
end Structural;
