----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:51:09
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
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        en : in STD_LOGIC;
        o: out STD_LOGIC_VECTOR(15 downto 0));
end registro;
architecture Behavioral of registro is
    signal y_temp: std_logic_vector(15 downto 0) := (others=>'0');
begin
    o<=y_temp;
    output: process(clk,rst)
    begin
        if (rst = '1') then
            y_temp<=(others=>'0');
        elsif(clk'event AND clk='1') then
            if (en='1') then
                y_temp<=D;
            end if;
        end if;
    end process;
end Behavioral;
