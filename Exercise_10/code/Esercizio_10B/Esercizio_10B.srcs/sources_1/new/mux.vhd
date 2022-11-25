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

entity mux is 
Port(
       a0 :in std_logic_vector(5 downto 0);
       a1 :in std_logic_vector(5 downto 0);
       s :in std_logic;
       y :out std_logic_vector(5 downto 0)
 );
end mux;

architecture Dataflow of mux is
begin
    y <= a1 when s='1' else a0 when s='0' else "XXXXXX";
end Dataflow;

