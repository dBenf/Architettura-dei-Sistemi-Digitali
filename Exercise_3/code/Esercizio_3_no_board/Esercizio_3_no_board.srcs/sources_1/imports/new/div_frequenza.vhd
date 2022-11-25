----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 19:02:59
-- Design Name: 
-- Module Name: div_frequenza - Behavioral
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

entity div_frequenza is
    generic(
        clock_frequency_in : integer;
        clock_frequency_out : integer);
    Port (
        clock_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clock_out : out STD_LOGIC);
end div_frequenza;

architecture Behavioral of div_frequenza is
    constant count_max_value : integer := clock_frequency_in/(clock_frequency_out)-1;
    signal clockfx : std_logic := '0';
    signal counter : integer range 0 to count_max_value := 0;
begin
    clock_out <= clockfx;
    count_for_division: process(clock_in, reset)
    begin
        if (reset = '1') then
            counter <= 0;
            clockfx <= '0';
        elsif (clock_in'event and clock_in = '1') then
            --metto la divisione della costante per 2 per poter inserire i 
            --valori reali di clock nella zona generic quando viene usato
            --il componente
            if counter = count_max_value/2 then
                clockfx <= '1';
                counter <= 0;
            else
                clockfx <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
