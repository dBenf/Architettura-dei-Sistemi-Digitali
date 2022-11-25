----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: unita_ctrl - structural
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

entity unita_ctrl is
    Port ( cout : in STD_LOGIC;
         start : in STD_LOGIC;
         risA : in STD_LOGIC;
         risB : in STD_LOGIC;
         clock : in STD_LOGIC;
         selA : out STD_LOGIC;
         selB : out STD_LOGIC;
         enA : out STD_LOGIC;
         enB : out STD_LOGIC;
         ricA : out STD_LOGIC;
         ricB : out STD_LOGIC);
end unita_ctrl;

architecture Behavioral of unita_ctrl is
    type state is (
        idle,
        ric_A,
        waitA,
        inA,
        ric_B,
        waitB,
        inB,
        op
    );

    signal stato_corrente : state := idle;
    signal stato_prossimo : state := idle;

begin

    reg_state: process(clock)
    begin
        if (clock'event and clock='1') then
            if (start='1') then
                stato_corrente<=ric_A;
            else
                stato_corrente<=stato_prossimo;
            end if;
        end if;
    end process;

    combinatorio : process(stato_corrente, cout, risA, risB)
    begin
        -- Inizializzazione
        selA<='0';
        selB<='0';
        enA<='0';
        enB<='0';
        ricA<='0';
        ricB<='0';
        stato_prossimo<=idle;
        -- Codifica dell'automa
        case stato_corrente is
            when idle =>
                stato_prossimo<=idle;
            when ric_A =>
                ricA<='1'; -- e' stato richiesto il dato A
                stato_prossimo<=waitA;
            when waitA =>
                if (risA='0') then
                    stato_prossimo<=waitA;
                elsif (risA='1') then
                    stato_prossimo<=inA;
                end if;
            when inA =>
                selA<='1';
                enA<='1';
                stato_prossimo<=ric_B;
            when ric_B =>
                ricB<='1'; -- e' stato richiesto il dato B
                stato_prossimo<=waitB;
            when waitB =>
                if (risB='0') then
                    stato_prossimo<=waitB;
                elsif (risB='1') then
                    stato_prossimo<=inB;
                end if;
            when inB =>
                selB<='1';
                enB<='1';
                stato_prossimo<=op;
            when op =>
                if (cout='1') then
                    enA<='1';
                    stato_prossimo<=op;
                elsif (cout='0') then
                    enB<='1';
                    stato_prossimo<=idle;
                end if;
                --if (cout = '0') then
                    --enB <= '1';
                    --stato_prossimo <= idle;
                --else
                    --selA <= '0';
                    --selB <= '1'; 
                    --enA <= '1';
                    --enB <= '1';
                    --stato_prossimo <= op;
                --end if;
        end case;
    end process;

end Behavioral;
