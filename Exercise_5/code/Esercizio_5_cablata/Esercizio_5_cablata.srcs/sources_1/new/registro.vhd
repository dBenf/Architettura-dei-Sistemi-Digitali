----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registro is
    Port ( d : in STD_LOGIC_VECTOR (7 downto 0);
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         en : in STD_LOGIC;
         o : out STD_LOGIC_VECTOR (7 downto 0));
end registro;

architecture Behavioral of registro is

signal y_conc : std_logic_vector(7 downto 0);

begin
    process(clock, reset)
    begin
        if (reset = '1') then
            y_conc <= (others => '0');
        elsif (clock'event and clock = '1') then
            if(en = '1') then
                y_conc <= d;
            end if;
        end if;
    end process;
    o <= y_conc;
end Behavioral;
