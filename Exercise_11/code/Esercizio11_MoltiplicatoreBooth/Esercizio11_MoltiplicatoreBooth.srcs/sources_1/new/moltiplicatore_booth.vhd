----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 14:22:22
-- Design Name: 
-- Module Name: moltiplicatore_booth - Structural
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

entity moltiplicatore_booth is
    Port (
        CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        START: in STD_LOGIC;
        in_0: in STD_LOGIC_VECTOR(7 downto 0);
        in_1: in STD_LOGIC_VECTOR(7 downto 0);
        output: out STD_LOGIC_VECTOR(15 downto 0)
    );
end moltiplicatore_booth;

architecture Structural of moltiplicatore_booth is
    component unita_controllo is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            START: in STD_LOGIC;
            FINE: in STD_LOGIC;
            Q0: in STD_LOGIC;
            Q1: in STD_LOGIC;
            SFT: out STD_LOGIC;
            SUBTRACT: out STD_LOGIC;
            LOAD_in_0: out STD_LOGIC;
            LOAD_in_1: out STD_LOGIC;
            COUNT: out STD_LOGIC
        );
    end component;
    component unita_operativa is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            SFT: in STD_LOGIC;
            CIN: in STD_LOGIC;
            in_0: in STD_LOGIC_VECTOR(7 downto 0);
            in_1: in STD_LOGIC_VECTOR(7 downto 0);
            LOAD_in_0: in STD_LOGIC;
            LOAD_in_1: in STD_LOGIC;
            output: out STD_LOGIC_VECTOR(15 downto 0);
            check_0: out STD_LOGIC;
            check_1: out STD_LOGIC
        );
    end component;
    component contatore is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            start_count: in STD_LOGIC;
            end_count: out STD_LOGIC
        );
    end component;
    
-- -----------------------------------
-- COMPONENTE PER LA SINTESI SU SCHEDA
-- -----------------------------------
-- component ButtonDebouncer is
-- Port (
-- RST : in STD_LOGIC;
-- CLK : in STD_LOGIC;
-- BTN : in STD_LOGIC;
-- CLEARED_BTN : out STD_LOGIC
-- );
-- end component;
-- -----------------------------------

    signal end_count: STD_LOGIC;
    signal k0: STD_LOGIC;
    signal k1: STD_LOGIC;
    signal sft: STD_LOGIC;
    signal subtract: STD_LOGIC;
    signal start_count: STD_LOGIC;
    signal load_in_0: STD_LOGIC;
    signal load_in_1: STD_LOGIC;

-- ----------------------------------------
-- SEGNALI INTERNI PER LA SINTESI SU SCHEDA
-- ----------------------------------------
-- signal cleared_input: STD_LOGIC;
-- signal reset_in: STD_LOGIC;
-- ----------------------------------------
begin
    --reset_in <= not RST; (SCHEDA)
-- -----------------------------------
-- COMPONENTE PER LA SINTESI SU SCHEDA
-- -----------------------------------
-- cleared_in: ButtonDebouncer
--     port map (
--         RST => reset_in,
--         CLK => CLK,
--         BTN => START,
--         CLEARED_BTN => cleared_input
-- );
-- ------------------------------------
    UC: unita_controllo
        port map(
            CLK => CLK,
            --RST => reset_in, (SCHEDA)
            RST => RST, --(SIMULAZIONE)
            --START => cleared_input, (SCHEDA)
            START => START, --(SIMULAZIONE)
            FINE => end_count,
            Q0 => k0,
            Q1 => k1,
            SFT => sft,
            SUBTRACT => subtract,
            LOAD_in_0 => load_in_0,
            LOAD_in_1 => load_in_1,
            COUNT => start_count
        );
    C: contatore
        port map(
            CLK => CLK,
            --RST => reset_in, (SCHEDA)
            RST => RST, --(SIMULAZIONE)
            start_count => start_count,
            end_count => end_count
        );
    UO: unita_operativa
        port map(
            CLK => CLK,
            --RST => reset_in, (SCHEDA)
            RST => RST, --(SIMULAZIONE)
            SFT => sft,
            CIN => subtract,
            in_0 => in_0,
            in_1 => in_1,
            LOAD_in_0 => load_in_0,
            LOAD_in_1 => load_in_1,
            output => output,
            check_0 => k0,
            check_1 => k1
        );
end Structural;
