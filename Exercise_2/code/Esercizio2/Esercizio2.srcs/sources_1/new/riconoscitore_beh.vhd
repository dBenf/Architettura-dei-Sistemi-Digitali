----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 13:00:58
-- Design Name: 
-- Module Name: riconoscitore_beh - Behavioral
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

entity riconoscitore_beh is
    Port ( i : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         y : out STD_LOGIC);
end riconoscitore_beh;

architecture Behavioral of riconoscitore_beh is
    type stato is (Q0,Q1,Q2,Q1p,Q2p);
    signal stato_corrente: stato := Q0;
begin
    stato_uscita_mem : process(clock)
    begin
        if (clock'event and clock='1') then
            if (reset = '1') then
                stato_corrente <= Q0;
                y<= '0';
            else
                case stato_corrente is
                    when Q0=>
                        if (i='0') then
                            stato_corrente<=Q1p;
                            y<='0';
                        else
                            stato_corrente<=Q1;
                            y<='0';
                        end if;
                    when q1=>
                        if (i='0') then
                            stato_corrente<=Q2;
                            y<='0';
                        else
                            stato_corrente<=Q2;
                            y<='0';
                        end if;
                    when Q2=>
                        if (i='0') then
                            stato_corrente<=Q0;
                            y<='0';
                        else
                            stato_corrente<=Q0;
                            y<='1';
                        end if;
                    when Q1p=>
                        if (i='0') then
                            stato_corrente<=Q2p;
                            y<='0';
                        else
                            stato_corrente<=Q2p;
                            y<='0';
                        end if;
                    when Q2p=>
                        if (i='0') then
                            stato_corrente<=Q0;
                            y<='0';
                        else
                            stato_corrente<=Q0;
                            y<='0';
                        end if;
                    when others =>
                        stato_corrente<=Q0;
                        y<='0';
                end case;
            end if;
        end if;
    end process;

end Behavioral;
