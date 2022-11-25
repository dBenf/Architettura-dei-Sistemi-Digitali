----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 22:23:25
-- Design Name: 
-- Module Name: shift_register_AQ - Behavioral
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

entity shift_register_AQ is
    generic ( N :integer :=4);
    Port (
        CLK : in std_logic;
        RST : in std_logic;
        dividendo : in std_logic_vector(N-1 downto 0);
        resto_parziale: in std_logic_vector(N-1 downto 0);
        output: out std_logic_vector(2*N-1 downto 0);
        start : in std_logic;
        load_resto_parziale : in std_logic;
        qi : in std_logic;
        qi_load : in std_logic;
        shift : in std_logic;
        Y : OUT std_logic := '0'
    );

end shift_register_AQ;

architecture Behavioral of shift_register_AQ is

    signal temp: std_logic_vector(2*N -1 downto 0) := (others => '0');
begin
    y <= temp(2*N - 1);
    SR: process(CLK, RST)
    begin
        if(RST = '1') then
            temp<=(others=>'0');
        elsif(rising_edge(CLK)) then
            if(start = '1') then
                temp(N-1 downto 0) <= dividendo;
            elsif (shift = '1') then
                temp <= temp(2*N -2 downto 0) & '0';
            elsif(load_resto_parziale = '1') then
                temp(2*N-1 downto N) <= resto_parziale;
            elsif (qi_load = '1') then
                temp(0) <= qi;
            end if;
        end if;
    end process;
    output <= temp;



end Behavioral;
