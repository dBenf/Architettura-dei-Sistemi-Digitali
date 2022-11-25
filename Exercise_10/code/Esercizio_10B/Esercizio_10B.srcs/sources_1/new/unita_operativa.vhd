----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 19:10:20
-- Design Name: 
-- Module Name: unita_operativa - Structural
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

entity unita_operativa is
    Port (
        in_0: in STD_LOGIC_VECTOR(5 downto 0);
        in_1: in STD_LOGIC_VECTOR(5 downto 0);
        sel: in STD_LOGIC_VECTOR(1 downto 0);
        out_0: out STD_LOGIC_VECTOR(5 downto 0);
        out_1: out STD_LOGIC_VECTOR(5 downto 0)
    );
end unita_operativa;

architecture Structural of unita_operativa is
    component mux is 
        Port(
               a0 :in std_logic_vector(5 downto 0);
               a1 :in std_logic_vector(5 downto 0);
               s :in std_logic;
               y :out std_logic_vector(5 downto 0)
         );
    end component;
begin
    mux_0: mux
        port map(
            a0 => in_0,
            a1 => in_1,
            s => sel(0),
            y => out_0
        );
    mux_1: mux
        port map(
            a0 => in_0,
            a1 => in_1,
            s => sel(1),
            y => out_1
        );
end Structural;
