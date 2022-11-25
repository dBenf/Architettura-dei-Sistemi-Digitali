----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 18:23:25
-- Design Name: 
-- Module Name: riconoscitore_1proc - Behavioral
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

entity riconoscitore_1proc is
    Port ( i : in STD_LOGIC;
         clock : in STD_LOGIC;
         y : out STD_LOGIC;
         reset : in STD_LOGIC);
end riconoscitore_1proc;

architecture Behavioral of riconoscitore_1proc is

    type stato is (Q0,Q1,Q2,Q3,Q4,Q5);
    signal stato_corrente: stato := Q0;
    signal stato_prossimo: stato;
    signal output: STD_LOGIC;

begin
    stati : process(stato_corrente, i)
    begin
        case stato_corrente is
            when Q0 =>
                if (i = '0') then
                    stato_prossimo <= Q0;
                    output <= '0';
                else
                    stato_prossimo <= Q1;
                    output <= '0';
                end if;
            when Q1 =>
                if (i = '0') then
                    stato_prossimo <= Q2;
                    output <= '0';
                else
                    stato_prossimo <= Q4;
                    output <= '0';
                end if;
            when Q2 =>
                if (i = '0') then
                    stato_prossimo <= Q0;
                    output <= '0';
                else
                    stato_prossimo <= Q5;
                    output <= '0';
                end if;
            when Q3 =>
                if (i = '0') then
                    stato_prossimo <= Q2;
                    output <= '1';
                else
                    stato_prossimo <= Q3;
                    output <= '0';
                end if;
            when Q4 =>
                if (i = '0') then
                    stato_prossimo <= Q2;
                    output <= '0';
                else
                    stato_prossimo <= Q3;
                    output <= '0';
                end if;
            when Q5 =>
                if (i = '0') then
                    stato_prossimo <= Q2;
                    output <= '1';
                else
                    stato_prossimo <= Q4;
                    output <= '0';
                end if;
            when others =>
                stato_prossimo <= Q0;
                output <= '0';
        end case;
    end process;
    
    transizione : process(clock)
    begin
        if(clock'event AND clock='1') then
            if (reset='1') then
                stato_corrente<=Q0;
                y<='0';
            else
                stato_corrente<=stato_prossimo;
                y<=output;
            end if;
        end if;
    end process;


end Behavioral;
