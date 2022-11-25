----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 16:09:38
-- Design Name: 
-- Module Name: switch_2_2 - Structural
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

entity switch_2_2 is
    Generic ( indice: integer :=0 );
    Port(
        in_0: in STD_LOGIC_VECTOR(5 downto 0);
        in_1: in STD_LOGIC_VECTOR(5 downto 0);
        out_0: out STD_LOGIC_VECTOR(5 downto 0);
        out_1: out STD_LOGIC_VECTOR(5 downto 0)
    );
end switch_2_2;

architecture Structural of switch_2_2 is
    component unita_operativa is
        Port (
            in_0: in STD_LOGIC_VECTOR(5 downto 0);
            in_1: in STD_LOGIC_VECTOR(5 downto 0);
            sel: in STD_LOGIC_VECTOR(1 downto 0);
            out_0: out STD_LOGIC_VECTOR(5 downto 0);
            out_1: out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;
    component unita_controllo is
        Generic( indice: integer := 0 );
        Port (
            in_0: in STD_LOGIC_VECTOR(3 downto 0);
            in_1: in STD_LOGIC_VECTOR(3 downto 0);
            s0: out STD_LOGIC;
            s1: out STD_LOGIC
        );
    end component;
    signal selector: STD_LOGIC_VECTOR(1 downto 0);
    signal k0: STD_LOGIC_VECTOR(3 downto 0);
    signal k1: STD_LOGIC_VECTOR(3 downto 0);
    signal sel0: STD_LOGIC;
    signal sel1: STD_LOGIC;
begin
    
    uc: unita_controllo
        generic map(indice => indice)
        port map(
            in_0 => in_0(5 downto 2),
            in_1 => in_1(5 downto 2),
            s0 => sel0,
            s1 => sel1
        );
        
    selector <= sel1 & sel0;
    
    uo: unita_operativa
        port map(
            in_0 => in_0,
            in_1 => in_1,
            sel => selector,
            out_0 => out_0,
            out_1 => out_1
        );
end Structural;
