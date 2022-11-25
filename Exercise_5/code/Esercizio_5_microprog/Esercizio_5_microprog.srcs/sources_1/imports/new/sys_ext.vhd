----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: sys_ext - structural
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

entity sys_ext is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         clock : in STD_LOGIC;
         start : in STD_LOGIC;
         ricA : in STD_LOGIC;
         ricB : in STD_LOGIC;
         datoA : out STD_LOGIC_VECTOR (7 downto 0);
         datoB : out STD_LOGIC_VECTOR (7 downto 0);
         risA : out STD_LOGIC;
         risB : out STD_LOGIC;
         reset : in STD_LOGIC);
end sys_ext;

architecture structural of sys_ext is
    signal enA : std_logic :='0';
    signal enB : std_logic :='0';

    component registro is
        port (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            en : in STD_LOGIC;
            o : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component unita_ctrl_ext is
        port (
            ricA : in STD_LOGIC;
            ricB : in STD_LOGIC;
            clock : in STD_LOGIC;
            start : in STD_LOGIC;
            enA : out STD_LOGIC;
            enB : out STD_LOGIC;
            risA : out STD_LOGIC;
            risB : out STD_LOGIC
        );
    end component;
begin
    registro_A : registro
        port map (
            D=>A,
            clock=>clock,
            reset=>reset,
            en=>enA,
            o=>datoA
        );
    registro_B : registro
        port map (
            D=>B,
            clock=>clock,
            reset=>reset,
            en=>enB,
            o=>datoB
        );
    unita_controllo : unita_ctrl_ext
        port map (
            ricA=> ricA,
            ricB=> ricB,
            clock=> clock,
            start=> start,
            enA => enA,
            enB=> enB,
            risA=> risA,
            risB=> risB
        );

end structural;
