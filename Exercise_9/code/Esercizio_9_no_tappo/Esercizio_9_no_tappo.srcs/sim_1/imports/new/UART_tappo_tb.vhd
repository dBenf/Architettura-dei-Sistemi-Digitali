----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 13:03:14
-- Design Name: 
-- Module Name: UART_tappo_tb - Behavioral
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

entity UART_tappo_tb is
end UART_tappo_tb;

architecture Behavioral of UART_tappo_tb is

    component UART2 is
        Port (
            clock: in std_logic;
            reset: in std_logic;
            start: in std_logic;
            dato_in: in std_logic_vector(7 downto 0);
            DBOUT: out std_logic_vector(7 downto 0)
        );
    end component;

    -- SEGNALI INTERNI
    signal clock: std_logic := '0';
    signal reset: std_logic := '0';
    signal start: std_logic := '0';
    signal dato_in: std_logic_vector(7 downto 0) := (others=>'0');
    signal DBOUT: std_logic_vector(7 downto 0) := (others=>'0');

    -- COSTANTI
    constant clk_per : time := 0.1 ns;
begin

    uut: UART2 port map (
            clock => clock,
            dato_in => dato_in,
            DBOUT => DBOUT,
            start => start,
            reset => reset
        );

    clk_proc : process
    begin
        clock <= '0';
        wait for clk_per/2;
        clock <= '1';
        wait for clk_per/2;
    end process;

    stim_proc : process
    begin
        wait for 10 ns;
        dato_in <= "01010101";
        wait for 20 ns;
        start <= '1';
        wait for 200 ns;
        start <= '0';
        wait;
    end process;
end Behavioral;
