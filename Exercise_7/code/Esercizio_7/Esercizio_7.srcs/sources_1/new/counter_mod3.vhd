----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 12:19:55
-- Design Name: 
-- Module Name: counter_mod3 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_mod3 is
    Port ( clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         mux_sel : out STD_LOGIC_VECTOR (1 downto 0);
         s_end : out STD_LOGIC;
         start_stop : in STD_LOGIC);
end counter_mod3;

architecture Behavioral of counter_mod3 is

    signal counter : integer range 0 to 3 :=0;

begin
    countProcess: process(clock,reset)
    begin
        if (clock'event and clock ='1') then
            if (reset = '1') then
                counter<=0;
            elsif (start_stop='1') then
                if (counter<4) then
                    counter<=counter+1;
                    s_end<='0';
                else
                    counter<=0;
                    s_end<='1';
                end if;
            end if;
        end if;
        mux_sel<=conv_std_logic_vector(counter,2);
    end process;

end Behavioral;
