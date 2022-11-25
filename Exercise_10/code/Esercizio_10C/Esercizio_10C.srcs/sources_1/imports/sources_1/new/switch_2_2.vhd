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
    Port(
        in_0: in STD_LOGIC_VECTOR(7 downto 0);
        in_1: in STD_LOGIC_VECTOR(7 downto 0);
        source_addr: in STD_LOGIC;
        destination_addr: in STD_LOGIC;
        out_1: out STD_LOGIC_VECTOR(7 downto 0);
        out_2: out STD_LOGIC_VECTOR(7 downto 0)
    );
end switch_2_2;

architecture Structural of switch_2_2 is
    component mux_2_1 is 
        Port(
               a0: in std_logic_vector (7 downto 0);
               a1: in std_logic_vector (7 downto 0);
               s: in std_logic;
               y: out std_logic_vector (7 downto 0)
         );
    end component;
    component demux_2_1 is
        Port (
            a: in std_logic_vector(7 downto 0);
            s: in std_logic;
            y0: out std_logic_vector(7 downto 0);
            y1: out std_logic_vector(7 downto 0)
        );
    end component;
    signal k: STD_LOGIC_VECTOR(7 downto 0);
begin
    mux: mux_2_1
        port map(
            a0 => in_0,
            a1 => in_1,
            s => source_addr,
            y => k
        );
    demux: demux_2_1
        port map(
            a => k,
            s => destination_addr,
            y0 => out_1,
            y1 => out_2
        );
end Structural;
