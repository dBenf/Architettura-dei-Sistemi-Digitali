----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 22:26:31
-- Design Name: 
-- Module Name: registroDivisore - Behavioral
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

entity registroDivisore is
    generic(N : integer := 4);
    Port (
        divisore : in std_logic_vector(N-1 downto 0);
        CLK, RST, start: in std_logic;
        output: out std_logic_vector(N-1 downto 0) := (others => '0')
    );
end registroDivisore;

architecture Behavioral of registroDivisore is

begin
    proc: process(clk, rst)
    begin
        if(RST = '1') then
            output <= (others=>'0');
        elsif(rising_edge(CLK)) then
            if (start = '1') then
                output <= divisore;
            end if;
        end if;
    end process;



end Behavioral;
