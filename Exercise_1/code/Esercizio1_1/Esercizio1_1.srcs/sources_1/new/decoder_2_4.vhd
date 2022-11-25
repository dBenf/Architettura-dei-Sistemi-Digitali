----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2022 21:15:13
-- Design Name: 
-- Module Name: decoder_2_4 - Behavioral
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

entity decoder_2_4 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           e : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2_4;

architecture Behavioral of decoder_2_4 is

begin
    process(a,b,e)
    begin
        if (e='1') then
            if (a='0' AND b='0') then
                o<="0001";
            elsif (a='1' AND b='0') then
                o<="0010";
            elsif (a='0' AND b='1') then
                o<="0100";
            elsif (a='1' AND b='1') then
                o<="1000";
            end if;
        else
            o<="0000";
        end if;
    end process;

end Behavioral;
