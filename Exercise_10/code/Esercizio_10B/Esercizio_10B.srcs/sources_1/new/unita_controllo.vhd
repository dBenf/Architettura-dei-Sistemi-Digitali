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
    Generic( indice: integer := 0 );
    Port (
        in_0: in STD_LOGIC_VECTOR(3 downto 0);
        in_1: in STD_LOGIC_VECTOR(3 downto 0);
        s0: out STD_LOGIC;
        s1: out STD_LOGIC
    );
end unita_controllo;

architecture Dataflow of unita_controllo is
begin
     s0 <= '1' when (in_0(3)='1' and in_1(3)='0' and in_1(indice)='0') OR
                    (in_0(indice)='1' and in_1(3)='0' and in_1(indice)='0') else
           '0' when (in_0(3)='0' and in_0(indice)='0') else
           'X';
     s1 <= '1' when (in_0(3)='1' and in_1(3)='0' and in_1(indice)='1') OR
                    (in_0(indice)='0' and in_1(3)='0' and in_1(indice)='1') else
           '0' when (in_0(3)='0' and in_0(indice)='1') else
           'X';
end Dataflow;
