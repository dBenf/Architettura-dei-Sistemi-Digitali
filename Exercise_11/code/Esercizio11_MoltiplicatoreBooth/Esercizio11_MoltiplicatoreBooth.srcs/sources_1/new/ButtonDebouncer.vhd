----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2021 10:04:57
-- Design Name: 
-- Module Name: ButtonDebouncer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ButtonDebouncer is
    generic (                       
        CLK_period:   integer := 10;  -- periodo del clock della board 10 nanosecondi
        btn_noise_time:   integer := 650000000 --intervallo di tempo in cui si ha l'oscillazione del bottone
                                            --assumo che duri 6.5ms=6500microsec=6500000ns
    );
    Port (
       RST : in STD_LOGIC;
       CLK : in STD_LOGIC;
       BTN : in STD_LOGIC;
       CLEARED_BTN : out STD_LOGIC
    );
end ButtonDebouncer;

architecture Behavioral of ButtonDebouncer is

type stato is (NOT_PRESSED, PRESSED);
signal BTN_state : stato := NOT_PRESSED;
constant max_count : integer := btn_noise_time/CLK_period; -- 650000000/10= conto 650000 colpi di clock 

begin
deb: process (CLK)
variable count: integer := 0;
begin
   if rising_edge(CLK) then  
	   if( RST = '1') then
	       BTN_state <= NOT_PRESSED;
	       CLEARED_BTN <= '0';
	   else
	   	  case BTN_state is
			when NOT_PRESSED =>
			    CLEARED_BTN<= '0';
				if( BTN = '1' ) then
					BTN_state <= PRESSED;
				else 
					BTN_state <= NOT_PRESSED;
				end if;
            when PRESSED =>
               if(count = max_count -1) then
                       count:=0;
                       CLEARED_BTN <= '1';
                       BTN_state <= NOT_PRESSED;
                   else 
                       count:= count+1;
                       BTN_state <= PRESSED;
                   end if;
            when others => 
                BTN_state <= NOT_PRESSED;
		  end case;
    end if;  
  end if;  
end process;
end Behavioral;