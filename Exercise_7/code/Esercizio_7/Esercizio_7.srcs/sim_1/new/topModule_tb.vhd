----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 13:01:16
-- Design Name: 
-- Module Name: topModule_tb - Behavioral
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

entity topModule_tb is
end topModule_tb;

architecture Behavioral of topModule_tb is

    -- COMPONENTE DA TESTARE
    component topModule is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
             B : in STD_LOGIC_VECTOR (7 downto 0);
             start_in : in STD_LOGIC;
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             result : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    -- SEGNALI DI TEST
    signal A : STD_LOGIC_VECTOR (7 downto 0) :=(others=>'0');
    signal B :  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
    signal start_in :  STD_LOGIC :='0';
    signal clock :  STD_LOGIC :='0';
    signal reset :  STD_LOGIC :='0';
    signal result :  STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');

    -- COSTANTI
    constant clk_per : TIME := 10ns;

begin

    uut : topModule
        port map(
            A=> A,
            B=> B,
            start_in => start_in,
            clock => clock,
            reset => reset,
            result => result
        );

    clk : process
    begin
        clock <= '0';
        wait for clk_per/2;
        clock <= '1';
        wait for clk_per/2;
    end process;

    test : process
    begin
        reset <= '1';
        wait for 5*clk_per;
        reset <= '0';
        wait for clk_per;
        
        start_in <= '1';
        wait for clk_per;
        start_in <= '0';
        A <= "00000010";
        B <= "00000110";
        wait for clk_per;
        A <= "00000111";
        B <= "00000011";
        wait for clk_per;
        A <= "00000010";
        B <= "00000101";
        wait for clk_per;
        A <= "00000000";
        B <= "00000000";
        
        wait;
        
    end process;

end Behavioral;
