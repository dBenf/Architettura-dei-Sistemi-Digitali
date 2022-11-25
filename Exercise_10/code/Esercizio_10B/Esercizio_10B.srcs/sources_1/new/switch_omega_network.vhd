----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 17:02:01
-- Design Name: 
-- Module Name: switch_omega_network - Structural
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

entity switch_omega_network is
    Port (
        inp_0: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_1: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_2: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_3: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_4: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_5: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_6: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        inp_7: in STD_LOGIC_VECTOR(5 downto 0) := (others=>'1');
        out_0: out STD_LOGIC_VECTOR(1 downto 0);
        out_1: out STD_LOGIC_VECTOR(1 downto 0);
        out_2: out STD_LOGIC_VECTOR(1 downto 0);
        out_3: out STD_LOGIC_VECTOR(1 downto 0);
        out_4: out STD_LOGIC_VECTOR(1 downto 0);
        out_5: out STD_LOGIC_VECTOR(1 downto 0);
        out_6: out STD_LOGIC_VECTOR(1 downto 0);
        out_7: out STD_LOGIC_VECTOR(1 downto 0)
    );
end switch_omega_network;

architecture Structural of switch_omega_network is
    component switch_2_2 is
        Generic ( indice: integer :=0 );
        Port(
            in_0: in STD_LOGIC_VECTOR(5 downto 0);
            in_1: in STD_LOGIC_VECTOR(5 downto 0);
            out_0: out STD_LOGIC_VECTOR(5 downto 0);
            out_1: out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;
    type collegamenti is ARRAY(0 to 7) of STD_LOGIC_VECTOR(5 downto 0);
    signal stadio1: collegamenti;
    signal stadio2: collegamenti;
    signal buffer_uscita: collegamenti;
begin
    s0: switch_2_2
        generic map(indice=>2)
        port map(
            in_0 => inp_0,
            in_1 => inp_4,
            out_0 => stadio1(0),
            out_1 => stadio1(1)
        );
    s1: switch_2_2
        generic map(indice=>2)
        port map(
            in_0 => inp_1,
            in_1 => inp_5,
            out_0 => stadio1(2),
            out_1 => stadio1(3)
        );
    s2: switch_2_2
        generic map(indice=>2)
        port map(
            in_0 => inp_2,
            in_1 => inp_6,
            out_0 => stadio1(4),
            out_1 => stadio1(5)
        );
    s3: switch_2_2
        generic map(indice=>2)
        port map(
            in_0 => inp_3,
            in_1 => inp_7,
            out_0 => stadio1(6),
            out_1 => stadio1(7)
        );
    s4: switch_2_2
        generic map(indice=>1)
        port map(
            in_0 => stadio1(0),
            in_1 => stadio1(4),
            out_0 => stadio2(0),
            out_1 => stadio2(2)
        );
    s5: switch_2_2
        generic map(indice=>1)
        port map(
            in_0 => stadio1(1),
            in_1 => stadio1(5),
            out_0 => stadio2(4),
            out_1 => stadio2(6)
        );
    s6: switch_2_2
        generic map(indice=>1)
        port map(
            in_0 => stadio1(2),
            in_1 => stadio1(6),
            out_0 => stadio2(1),
            out_1 => stadio2(3)
        );
    s7: switch_2_2
        generic map(indice=>1)
        port map(
            in_0 => stadio1(3),
            in_1 => stadio1(7),
            out_0 => stadio2(5),
            out_1 => stadio2(7)
        );
    s8: switch_2_2
        generic map(indice=>0)
        port map(
            in_0 => stadio2(0),
            in_1 => stadio2(1),
            out_0 => buffer_uscita(0),
            out_1 => buffer_uscita(1)
        );
    s9: switch_2_2
    generic map(indice=>0)
        port map(
            in_0 => stadio2(2),
            in_1 => stadio2(3),
            out_0 => buffer_uscita(2),
            out_1 => buffer_uscita(3)
        );
    s10: switch_2_2
    generic map(indice=>0)
        port map(
            in_0 => stadio2(4),
            in_1 => stadio2(5),
            out_0 => buffer_uscita(4),
            out_1 => buffer_uscita(5)
        );
    s11: switch_2_2
        generic map(indice=>0)
        port map(
            in_0 => stadio2(6),
            in_1 => stadio2(7),
            out_0 => buffer_uscita(6),
            out_1 => buffer_uscita(7)
        );
    out_0<=buffer_uscita(0)(1 downto 0);
    out_1<=buffer_uscita(1)(1 downto 0);
    out_2<=buffer_uscita(2)(1 downto 0);
    out_3<=buffer_uscita(3)(1 downto 0);
    out_4<=buffer_uscita(4)(1 downto 0);
    out_5<=buffer_uscita(5)(1 downto 0);
    out_6<=buffer_uscita(6)(1 downto 0);
    out_7<=buffer_uscita(7)(1 downto 0);
end Structural;
