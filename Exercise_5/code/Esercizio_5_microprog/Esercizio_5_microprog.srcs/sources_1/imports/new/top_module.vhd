----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2022 18:09:26
-- Design Name: 
-- Module Name: top_module - structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         AmodB : out STD_LOGIC_VECTOR (7 downto 0);
         start : in STD_LOGIC);
end top_module;

architecture structural of top_module is

    -- Segnali interni
    signal datoA : std_logic_vector(7 downto 0) := (others=>'0');
    signal datoB : std_logic_vector(7 downto 0) := (others=>'0');
    signal ricA : std_logic := '0';
    signal risA : std_logic := '0';
    signal ricB : std_logic := '0';
    signal risB : std_logic := '0';
    signal selA : std_logic := '0';
    signal enA : std_logic := '0';
    signal selB : std_logic := '0';
    signal enB : std_logic := '0';
    signal cout : std_logic := '0';

    -- Componenti
    component sys_ext is
        port (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            clock : in STD_LOGIC;
            start : in STD_LOGIC;
            ricA : in STD_LOGIC;
            ricB : in STD_LOGIC;
            datoA : out STD_LOGIC_VECTOR(7 downto 0);
            datoB : out STD_LOGIC_VECTOR(7 downto 0);
            risA : out STD_LOGIC;
            risB : out STD_LOGIC;
            reset : in STD_LOGIC
        );
    end component;

    component unita_ctrl_microprog is
        Port ( cout : in STD_LOGIC;
             start : in STD_LOGIC;
             risA : in STD_LOGIC;
             risB : in STD_LOGIC;
             clock : in STD_LOGIC;
             selA : out STD_LOGIC;
             selB : out STD_LOGIC;
             enA : out STD_LOGIC;
             enB : out STD_LOGIC;
             ricA : out STD_LOGIC;
             ricB : out STD_LOGIC);
    end component;

    component unita_op is
        Port ( binA : in STD_LOGIC_VECTOR (7 downto 0);
             binB : in STD_LOGIC_VECTOR (7 downto 0);
             selA : in STD_LOGIC :='0';
             selB : in STD_LOGIC :='0';
             enA : in STD_LOGIC :='0';
             enB : in STD_LOGIC :='0';
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             Bout : out STD_LOGIC_VECTOR (7 downto 0);
             cout : out STD_LOGIC);
    end component;

begin
    -- SISTEMA ESTERNO
    sistema_esterno_S : sys_ext
        port map (
            A => A,
            B => B,
            clock => clock,
            start => start,
            ricA => ricA,
            ricB => ricB,
            datoA => datoA,
            datoB => datoB,
            risA => risA,
            risB => risB,
            reset => reset
        );

    --UNITA DI CONTROLLO
    unita_controllo : unita_ctrl_microprog
        port map (
            clock => clock,
            start => start,
            cout => cout,
            selA => selA,
            enA => enA,
            enB => enB,
            selB => selB,
            risA => risA,
            risB => risB,
            ricA => ricA,
            ricB => ricB
        );

    -- UNITA OPERATIVA
    unita_operativa : unita_op
        port map (
            BinA => datoA,
            BinB => datoB,
            selA => selA,
            selB => selB,
            enA => enA,
            enB => enB,
            clock => clock,
            reset => reset,
            Bout => AmodB,
            cout => cout
        );

end structural;
