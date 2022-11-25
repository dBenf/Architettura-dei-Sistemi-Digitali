----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 12:45:36
-- Design Name: 
-- Module Name: shift_register - Behavioral
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

entity shift_register is
    Port (
        CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        SFT: in STD_LOGIC;
        LOAD_in_0: in STD_LOGIC;
        LOAD_in_1: in STD_LOGIC;
        in_0: in STD_LOGIC_VECTOR(7 downto 0);
        in_1: in STD_LOGIC_VECTOR(7 downto 0);
        check_0: out STD_LOGIC;
        check_1: out STD_LOGIC;
        out_0: out STD_LOGIC_VECTOR(7 downto 0);
        out_1: out STD_LOGIC_VECTOR(7 downto 0)
    );
end shift_register;

architecture Behavioral of shift_register is
    signal T: STD_LOGIC_VECTOR(16 downto 0);
begin
    reg: process(CLK, RST)
    begin
        if(RST='1') then
            T <= (others => '0');
        elsif(CLK'event and CLK='0') then
            if(SFT='1') then
                T(16) <= T(16);
                for i in 16 downto 1 loop
                    T(i-1) <= T(i);
                end loop;
            end if;
            if(LOAD_in_0='1') then
                T(16 downto 9) <= in_0(7 downto 0);
            end if;
            if(LOAD_in_1='1') then
                T(8 downto 1) <= in_1(7 downto 0);
            end if;
        end if;
    end process;
    
    out_0 <= T(16 downto 9);
    out_1 <= T(8 downto 1);
    check_0 <= T(0);
    check_1 <= T(1);
end Behavioral;








