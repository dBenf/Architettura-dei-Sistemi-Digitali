----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 22:28:57
-- Design Name: 
-- Module Name: FFD - Behavioral
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

entity FFD is
    Port (
        CLK, RST, d, EN: in std_logic;
        y: out std_logic :='0'
    );
end FFD;

architecture Behavioral of FFD is

begin
    FF_D: process(clk, rst)
    begin
        if(RST = '1') then
            y <= '0';
        elsif(falling_edge(CLK)) then
            if (EN = '1') then
                y <= d;
            end if;
        end if;
    end process;


end Behavioral;
