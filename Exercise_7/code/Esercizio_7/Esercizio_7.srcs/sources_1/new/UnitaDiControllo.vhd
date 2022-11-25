----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 12:20:57
-- Design Name: 
-- Module Name: UnitaControllo - Behavioral
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

entity UnitaControllo is
    Port ( clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         start_in : in STD_LOGIC;
         start : out STD_LOGIC;
         s_end : in STD_LOGIC;
         acc_en : out STD_LOGIC;
         result_en : out STD_LOGIC;
         read_en : out STD_LOGIC_VECTOR (1 downto 0));
end UnitaControllo;

architecture Behavioral of UnitaControllo is

    type stato is (idle, read1, read2, read3, op);
    signal stato_corrente, stato_prossimo : stato := idle;

begin

    state : process (clock, reset)
    begin
        if (clock'event and clock ='1') then
            if (stato_corrente = idle and reset ='1') then
                stato_corrente <= idle;
            else
                stato_corrente <= stato_prossimo;
            end if;
        end if;
    end process;

    fsm : process(stato_corrente,stato_prossimo, clock)
    begin
        start <= '0';
        read_en <= "00";
        acc_en <= '0';
        result_en <= '0';
        if (reset = '1') then
            stato_prossimo <= idle;
        end if;

        case stato_corrente is
            when idle =>
                start <= '0';
                read_en <= "00";
                acc_en <= '0';
                result_en <= '0';
                if (start_in = '1') then
                    stato_prossimo <= read1;
                else
                    stato_prossimo <= idle;
                end if;

            when read1 =>
                start <= '0';
                read_en <= "01";
                acc_en <= '1';
                result_en <= '0';
                stato_prossimo <= read2;

            when read2 =>
                start <= '0';
                read_en <= "10";
                acc_en <= '1';
                result_en <= '0';
                stato_prossimo <= read3;

            when read3 =>
                start <= '0';
                read_en <= "11";
                acc_en <= '1';
                result_en <= '0';
                stato_prossimo <= op;

            when op =>
                start <= '1';
                read_en <= "00";
                acc_en <= '1';
                if(s_end ='1') then
                    result_en <= '1';
                    stato_prossimo <= idle;
                else
                    stato_prossimo <= op;
                end if;

            when others =>
                stato_prossimo <= idle;

        end case;
    end process;


end Behavioral;
