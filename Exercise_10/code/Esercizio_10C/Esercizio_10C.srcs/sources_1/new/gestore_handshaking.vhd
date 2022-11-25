----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 10:38:37
-- Design Name: 
-- Module Name: gestore_handshaking - Behavioral
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

entity gestore_handshaking is
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
end gestore_handshaking;

architecture Behavioral of gestore_handshaking is
    signal source: STD_LOGIC_VECTOR(1 downto 0);
    signal destination: STD_LOGIC_VECTOR(1 downto 0);
    signal dato: STD_LOGIC_VECTOR(1 downto 0);
    
    type stato is (IDLE, create_msgHand, send_handshake, wait_response, send_dato);
    signal stato_corrente: stato := IDLE;
    signal stato_prossimo: stato;
begin
    source <= SRC;
    destination <= MEX(3 downto 2);
    dato <= MEX(1 downto 0);
    
    f_stato_uscita: process(stato_corrente, CLK)
    begin
        case stato_corrente is
            when IDLE =>
                --Se deve trasmettere o se deve essere pronto a trasmettere
                --evolve i due bit più significativi indicando il tipo di messaggio
                --Pronto a trasmettere <= "10"
                if(EN='1' or RX(7 downto 6)="10") then
                    stato_prossimo <= create_msgHand;
                else
                    stato_prossimo <= IDLE;
                end if;
                TX <= (others=>'0');
                TX_en <= '0';
                --Nel caso voglia trasmettere deve generare il segnale pronto a trasmettere
            when create_msgHand =>
                --Richiesta di trasmissione, devo verificare quale condizione è vera
                if(EN='1') then
                    TX <= "10" & source & destination & dato;
                    --Richiesta di trasmissione accettata
                elsif(RX(7 downto 6)="10") then
                    --Nodo pronto a ricevere
                    TX <= "01" & SRC & RX(5 downto 4) & RX(1 downto 0);
                end if;
                stato_prossimo <= send_handshake;
            when send_handshake =>
                --Viene abilitata la trasmissione nella rete
                TX_EN <= '1';
                stato_prossimo <= wait_response;
            when wait_response =>
                TX_en <= '0';
                --Se riceve pronto a ricevere può inviare i dati
                if(RX(7 downto 6)="01") then
                    --Invia il dato
                    TX <= "11" & source & destination & dato;
                    stato_prossimo <= send_dato;
                --Se riceve i dati, li mette in output
                elsif(RX(7 downto 6)="11") then
                    --Resetta TX per una nuova comunicazione
                    TX <= (others=>'-');
                    dato_ricevuto <= RX(1 downto 0);
                    stato_prossimo <= IDLE;
                elsif(RX(7 downto 6)="10") then
                    TX <= (others => '-');
                    dato_ricevuto <= RX(1 downto 0);
                    stato_prossimo <= IDLE;
                else
                    stato_prossimo <= wait_response;
                end if;
            when send_dato =>
                TX_en <= '1';
                stato_prossimo <= IDLE;
        end case;
    end process;
        
    memoria: process(CLK, RST)
    begin
        if(CLK'event and CLK='1') then
            if(RST='1') then
                stato_corrente <= IDLE;
            else
                stato_corrente <= stato_prossimo;
            end if;
        end if;
    end process;
end Behavioral;
