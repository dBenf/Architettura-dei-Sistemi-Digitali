----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:58:25
-- Design Name: 
-- Module Name: demux_2_1 - Behavioral
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

entity demux_2_1 is
    Port (
        a: in std_logic_vector(1 downto 0);
        s: in std_logic;
        y0: out std_logic_vector(1 downto 0);
        y1: out std_logic_vector(1 downto 0)
    );
end demux_2_1;

architecture Dataflow of demux_2_1 is
begin
    y0<= a when s='0' else "XX";
    y1<= a when s='1' else "XX";
end Dataflow;