----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 13:04:43
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
        CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        SFT: in STD_LOGIC;
        CIN: in STD_LOGIC;
        in_0: in STD_LOGIC_VECTOR(7 downto 0);
        in_1: in STD_LOGIC_VECTOR(7 downto 0);
        LOAD_in_0: in STD_LOGIC;
        LOAD_in_1: in STD_LOGIC;
        output: out STD_LOGIC_VECTOR(15 downto 0);
        check_0: out STD_LOGIC;
        check_1: out STD_LOGIC
    );
end unita_operativa;

architecture Structural of unita_operativa is
    component ripple_carry_adder is
        Port (
            in_0: in STD_LOGIC_VECTOR(7 downto 0);
            in_1: in STD_LOGIC_VECTOR(7 downto 0);
            CIN: in STD_LOGIC;
            SUM: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    component shift_register is
        Port (
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            SFT: in STD_LOGIC;
            LOAD_in_0: in STD_LOGIC;
            LOAD_in_1: in STD_LOGIC;
            in_0: in STD_LOGIC_VECTOR(7 downto 0);
            in_1: in STD_LOGIC_VECTOR(7 downto 0);
            check_0: out STD_LOGIC;
            check_1: out STD_LOGIC;
            out_0: out STD_LOGIC_VECTOR(7 downto 0);
            out_1: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    signal somma: STD_LOGIC_VECTOR(7 downto 0);
    signal prodotto_0: STD_LOGIC_VECTOR(7 downto 0);
    signal prodotto_1: STD_LOGIC_VECTOR(7 downto 0);
begin
    sr: shift_register
        port map (
            CLK => CLK,
            RST => RST,
            SFT => SFT,
            LOAD_in_0 => LOAD_in_0,
            LOAD_in_1 => LOAD_in_1,
            in_0 => somma,
            in_1 => in_1,
            check_0 => check_0,
            check_1 => check_1,
            out_0 => prodotto_0,
            out_1 => prodotto_1
        );
        rca: ripple_carry_adder
            port map(
                in_0 => prodotto_0,
                in_1 => in_0,
                CIN => CIN,
                SUM => somma
            );
    output <= prodotto_0 & prodotto_1;
end Structural;
