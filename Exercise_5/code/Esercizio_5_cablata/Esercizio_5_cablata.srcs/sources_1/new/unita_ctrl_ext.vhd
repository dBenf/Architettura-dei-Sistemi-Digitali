----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2022 18:04:19
-- Design Name: 
-- Module Name: unita_ctrl_ext - Behavioral
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

entity unita_ctrl_ext is
    Port ( ricA : in STD_LOGIC;
         ricB : in STD_LOGIC;
         clock : in STD_LOGIC;
         start : in STD_LOGIC;
         enA : out STD_LOGIC;
         enB : out STD_LOGIC;
         risA : out STD_LOGIC;
         risB : out STD_LOGIC);
end unita_ctrl_ext;

architecture Behavioral of unita_ctrl_ext is

    type state is (idle,waitA,sendA,waitB,sendB);
    signal stato_corrente, stato_prossimo : state;

begin
    reg_state: PROCESS(clock) is
    begin
        if (clock'event and clock='1') then
            if (start='1') then
                stato_corrente<=waitA;
            else
                stato_corrente<=stato_prossimo;
            end if;
        end if;
    end process;

    combinatorio: process(stato_corrente,ricA,ricB) is
    begin
        -- Inizializzazione
        enA<='0';
        enB<='0';
        risA<='0';
        risB<='0';
        stato_prossimo<=idle;
        CASE stato_corrente is
            WHEN idle =>
                stato_prossimo<=idle;
            WHEN waitA =>
                if (ricA='0') then
                    stato_prossimo<=waitA;
                elsif (ricA='1') then
                    stato_prossimo<=sendA;
                end if;
            WHEN sendA =>
                enA<='1';
                risA<='1';
                stato_prossimo<=waitB;
            WHEN waitB =>
                if (ricB='0') then
                    stato_prossimo<=waitB;
                elsif (ricB='1') then
                    stato_prossimo<=sendB;
                end if;
            WHEN sendB =>
                enB<='1';
                risB<='1';
                stato_prossimo<=idle;
        end CASE;
    end process;

end Behavioral;
