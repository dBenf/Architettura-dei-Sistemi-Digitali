----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 19:03:20
-- Design Name: 
-- Module Name: memoria - structural
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

entity memoria is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           xp : out STD_LOGIC_VECTOR (2 downto 0));
end memoria;

architecture structural of memoria is

component flipflopD is
    Port ( d : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         o : out STD_LOGIC);
end component;

begin
    FF0 : flipflopD
        port map(
            d => x(0),
            clock => clock,
            reset => reset,
            o => xp(0)
            );
    FF1 : flipflopD
        port map(
            d => x(1),
            clock => clock,
            reset => reset,
            o => xp(1)
            );
    FF2 : flipflopD
        port map(
            d => x(2),
            clock => clock,
            reset => reset,
            o => xp(2)
            );
        
end structural;
