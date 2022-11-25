----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 16:43:44
-- Design Name: 
-- Module Name: unita_controllo - Dataflow
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
end unita_controllo;

architecture Dataflow of unita_controllo is
    signal k0, k1, k2, k3: STD_LOGIC;
    signal buff: STD_LOGIC_VECTOR(1 downto 0);
begin
    --1. Determino la priorità
    k0 <= en_in_0;
    k1 <= (not en_in_0) and en_in_1;
    k2 <= (not en_in_0) and (not en_in_1) and en_in_2;
    k3 <= (not en_in_0) and (not en_in_1) and (not en_in_2) and en_in_3;
    --2. Codifico l'indirizzo sorgente
    buff(1) <= ((not k0) and (not k1) and (not k2) and k3) or ((not k0) and (not k1) and k2 and (not k3));
    buff(0) <= ((not k0) and (not k1) and (not k2) and k3) or ((not k0) and k1 and (not k2) and (not k3));
    source_addr(1) <= buff(1);
    source_addr(0) <= buff(0);
    --3. Determino l'indirizzo di destinazione
    with buff select
        destination_addr <=
            destination_in_0 when "00",
            destination_in_1 when "01",
            destination_in_2 when "10",
            destination_in_3 when "11",
            "UU" when others;
end Dataflow;
