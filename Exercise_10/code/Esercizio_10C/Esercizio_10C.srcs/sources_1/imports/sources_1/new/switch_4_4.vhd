----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 16:26:18
-- Design Name: 
-- Module Name: switch_4_4 - Structural
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

entity switch_4_4 is
    Port (
        inp_0: in STD_LOGIC_VECTOR(7 downto 0);
        inp_1: in STD_LOGIC_VECTOR(7 downto 0);
        inp_2: in STD_LOGIC_VECTOR(7 downto 0);
        inp_3: in STD_LOGIC_VECTOR(7 downto 0);
        source_add: in STD_LOGIC_VECTOR(1 downto 0);
        destination_add: in STD_LOGIC_VECTOR(1 downto 0);
        out_1: out STD_LOGIC_VECTOR(7 downto 0);
        out_2: out STD_LOGIC_VECTOR(7 downto 0);
        out_3: out STD_LOGIC_VECTOR(7 downto 0);
        out_4: out STD_LOGIC_VECTOR(7 downto 0)
    );
end switch_4_4;

architecture Structural of switch_4_4 is
    component switch_2_2 is
        Port(
            in_0: in STD_LOGIC_VECTOR(7 downto 0);
            in_1: in STD_LOGIC_VECTOR(7 downto 0);
            source_addr: in STD_LOGIC;
            destination_addr: in STD_LOGIC;
            out_1: out STD_LOGIC_VECTOR(7 downto 0);
            out_2: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    type intermedio is array(0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
    signal buff: intermedio;
begin
    switch_0: switch_2_2
        port map(
            in_0 => inp_0,
            in_1 => inp_2,
            source_addr => source_add(1),
            destination_addr => destination_add(1),
            out_1 => buff(0),
            out_2 => buff(1)
        );
    switch_1: switch_2_2
        port map(
            in_0 => inp_1,
            in_1 => inp_3,
            source_addr => source_add(1),
            destination_addr => destination_add(1),
            out_1 => buff(2),
            out_2 => buff(3)
        );
    switch_2: switch_2_2
    port map(
        in_0 => buff(0),
        in_1 => buff(2),
        source_addr => source_add(0),
        destination_addr => destination_add(0),
        out_1 => out_1,
        out_2 => out_2
    );
    switch_3: switch_2_2
    port map(
        in_0 => buff(1),
        in_1 => buff(3),
        source_addr => source_add(0),
        destination_addr => destination_add(0),
        out_1 => out_3,
        out_2 => out_4
    );
end Structural;
