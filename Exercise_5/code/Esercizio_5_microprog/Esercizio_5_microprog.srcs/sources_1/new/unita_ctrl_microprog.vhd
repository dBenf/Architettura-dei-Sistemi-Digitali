----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2022 20:10:51
-- Design Name: 
-- Module Name: unita_ctrl_microprog - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unita_ctrl_microprog is
    port(
        clock: in std_logic;
        start: in std_logic;
        cout: in std_logic;
        selA: out std_logic;
        enA: out std_logic;
        enB: out std_logic;
        selB: out std_logic;
        risA: in std_logic;
        risB: in std_logic;
        ricA: out std_logic;
        ricB: out std_logic
    );
end unita_ctrl_microprog;

architecture microprogramming of unita_ctrl_microprog is

    component microRom is
        port(
            PC: in unsigned(2 downto 0);
            PC_next: out unsigned (2 downto 0);
            JCount: out std_logic;
            enA: out std_logic;
            selA: out std_logic;
            enB: out std_logic;
            selB: out std_logic;
            ricA: out std_logic;
            ricB: out std_logic
        );
    end component;

    signal PC_next,PC : unsigned(2 downto 0);
    signal enA_temp,enB_temp,JCount: std_logic;

begin
    rom: MicroRom
        port map(
            PC=>PC,
            PC_next=>PC_next,
            JCount=>JCount,
            enA=>enA_temp,
            selA=>selA,
            enB=>enB_temp,
            selB=>selB,
            ricA=>ricA,
            ricB=>ricB
        );

    reg_PC: PROCESS(clock)
    begin
        if(clock'event and clock='1') then
            if(start='1') then
                PC<="001";
            elsif(risA='1')then
                PC<="011";
            elsif(risB='1')then
                PC<="110";
            elsif(JCount='0')then
                PC<=PC_next;
            else
                if(cout='0')then
                    PC<="000";
                end if;
            end if;
        end if;
    end process;

    enA<=enA_temp when JCount='0' else cout;
    enB<=enB_temp when JCount='0' else not(cout);

end microprogramming;
