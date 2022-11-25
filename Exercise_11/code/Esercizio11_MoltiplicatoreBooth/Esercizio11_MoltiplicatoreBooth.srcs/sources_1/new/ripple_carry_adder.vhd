----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 12:24:23
-- Design Name: 
-- Module Name: ripple_carry_adder - Structural
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

entity ripple_carry_adder is
    Port (
        in_0: in STD_LOGIC_VECTOR(7 downto 0);
        in_1: in STD_LOGIC_VECTOR(7 downto 0);
        CIN: in STD_LOGIC;
        SUM: out STD_LOGIC_VECTOR(7 downto 0)
    );
end ripple_carry_adder;

architecture Structural of ripple_carry_adder is
    component full_adder
        Port(
            in_0: in STD_LOGIC;
            in_1: in STD_LOGIC;
            c_in: in STD_LOGIC;
            c_out: out STD_LOGIC;
            sum: out STD_LOGIC
        );
    end component;
    
    signal complemento: STD_LOGIC_VECTOR(7 downto 0);
    signal carry: STD_LOGIC_VECTOR(7 downto 0);
begin
    complemento_y: FOR i in 0 to 7 GENERATE
        complemento(i) <= in_1(i) XOR CIN;
    END GENERATE;
    first: full_adder
        port map(
            in_0 => in_0(0),
            in_1 => complemento(0),
            c_in => CIN,
            c_out => carry(0),
            sum => SUM(0)
        );
    addizionatore: FOR i in 1 to 7 GENERATE
        fa_1_7: full_adder
            port map(
                in_0 => in_0(i),
                in_1 => complemento(i),
                c_in => carry(i-1),
                c_out => carry(i),
                sum => SUM(i)
            );
        END GENERATE;
end Structural;
