----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 12:38:29
-- Design Name: 
-- Module Name: reg_scorrimento_beh - Behavioral
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

entity reg_scorrimento_beh is
    Port ( selection : in STD_LOGIC_VECTOR (0 to 1); --selezione della modalità
           x : in STD_LOGIC; --bit da caricare nella modalità 4
           clock : in STD_LOGIC; --segnale di tempificazione
           reset : in STD_LOGIC; --reset dei FF
           load : in STD_LOGIC; --segnale di abilitazione del caricamento
           A : in STD_LOGIC_VECTOR (0 to 3); --dato da caricare
           y : out STD_LOGIC_VECTOR (0 to 3)); --segnale di output
end reg_scorrimento_beh;

architecture Behavioral of reg_scorrimento_beh is

    signal output : std_logic_vector(0 to 3);

begin
    process(clock, reset)
    begin
        if(reset = '1') then
            output <= "0000";
        elsif(clock'event and clock='0') then
            if(load = '1') then
                output <= A;
            -- '00' indica lo scorrimento a sinistra
            elsif(load = '0' and selection = "00") then
                output(3) <= '0';
                output(0 to 2) <= output(1 to 3);
            -- '01' indica lo scorrimento a destra
            elsif(load = '0' and selection = "01") then
                output(0) <= '0';
                output(1 to 3) <= output(0 to 2);
            -- '10' indica lo scorrimento circolare
            elsif(load = '0' and selection = "10") then
                output(3) <= output(0);
                output(0 to 2) <= output(1 to 3);
            -- '11' indica lo scorrimento di X a destra
            elsif(load = '0' and selection = "11") then
                output(3) <= x;
                output(0 to 2) <= output(1 to 3);
            else
                output <= "XXXX";
            end if;
        end if;
    end process;

    y <= output;

end Behavioral;
