----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 13:39:50
-- Design Name: 
-- Module Name: contatore - Behavioral
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

entity contatore is
    Port (
        CLK: in STD_LOGIC;
        RST: in STD_LOGIC;
        start_count: in STD_LOGIC;
        end_count: out STD_LOGIC
    );
end contatore;

architecture Behavioral of contatore is
    signal k: STD_LOGIC_VECTOR(2 downto 0);
begin
    contatore_modulo_8: process(CLK, RST)
        begin
            if(RST='1') then
                k <= (others => '0');
                end_count <= '0';
            elsif(CLK'event and CLK='0' and start_count='1') then
                k <= STD_LOGIC_VECTOR(unsigned(k)+1);
                if(k="111") then
                    end_count <= '1';
                else
                    end_count <= '0';
                end if;
            end if;
        end process;
end Behavioral;
