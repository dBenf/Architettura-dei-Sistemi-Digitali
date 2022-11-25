----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2021 15:31:24
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
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

entity mux_2_1 is 
Port(
       a0 :in std_logic_vector(7 downto 0);
       a1 :in std_logic_vector(7 downto 0);
       s :in std_logic;
       y :out std_logic_vector(7 downto 0)
 );
end mux_2_1;

architecture Dataflow of mux_2_1 is
begin
    y <= a0 when s='0' else a1 when s='1' else "UUUUUUUU";
end Dataflow;