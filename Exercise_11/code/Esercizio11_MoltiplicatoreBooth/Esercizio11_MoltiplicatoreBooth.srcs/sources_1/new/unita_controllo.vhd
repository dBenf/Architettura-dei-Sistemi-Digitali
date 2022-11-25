----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 13:49:40
-- Design Name: 
-- Module Name: unita_controllo - Behavioral
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

entity unita_controllo is
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
end unita_controllo;

architecture Behavioral of unita_controllo is
    type stato is (IDLE, CARICAMENTO, DECISIONE, SOTTRAZIONE, ADDIZIONE, SCORRIMENTO);
    signal stato_corrente: stato;
begin
    controllo: process(CLK, RST)
        begin
            if(RST='1') then
                stato_corrente <= IDLE;
            elsif(CLK'event and CLK='1') then
                case stato_corrente is
                    when IDLE =>
                        SUBTRACT <= '0';
                        LOAD_in_0 <= '0';
                        LOAD_in_1 <= '0';
                        SFT <= '0';
                        COUNT <= '0';
                        if(START='1') then
                            stato_corrente <= CARICAMENTO;
                        else
                            stato_corrente <= IDLE;
                        end if;
                    when CARICAMENTO =>
                        LOAD_in_1 <= '1';
                        stato_corrente <= DECISIONE;
                    when DECISIONE =>
                        COUNT <= '0';
                        SFT <= '0';
                        LOAD_in_1 <= '0';
                        if(FINE='1') then
                            stato_corrente <= IDLE;
                        elsif(Q0='0' and Q1='1') then
                            stato_corrente <= SOTTRAZIONE;
                        elsif(Q0='1' and Q1='0') then
                            stato_corrente <= ADDIZIONE;
                        else
                            stato_corrente <= SCORRIMENTO;
                        end if;
                    when SOTTRAZIONE =>
                        LOAD_in_0 <= '1';
                        SUBTRACT <= '1';
                        stato_corrente <= SCORRIMENTO;
                    when ADDIZIONE =>
                        LOAD_in_0 <= '1';
                        SUBTRACT <= '0';
                        stato_corrente <= SCORRIMENTO;
                    when SCORRIMENTO =>
                        LOAD_in_0 <= '0';
                        SUBTRACT <= '0';
                        COUNT <= '1';
                        SFT <= '1';
                        stato_corrente <= DECISIONE;
                end case;
            end if;
        end process;
end Behavioral;
