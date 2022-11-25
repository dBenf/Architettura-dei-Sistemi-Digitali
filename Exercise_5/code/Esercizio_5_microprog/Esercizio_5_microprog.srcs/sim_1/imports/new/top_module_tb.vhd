----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2022 18:23:13
-- Design Name: 
-- Module Name: top_module_tb - Behavioral
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

entity top_module_tb is
end top_module_tb;

architecture Behavioral of top_module_tb is

    component top_module is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
             B : in STD_LOGIC_VECTOR (7 downto 0);
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             AmodB : out STD_LOGIC_VECTOR (7 downto 0);
             start : in STD_LOGIC);
    end component;

    signal A : STD_LOGIC_VECTOR (7 downto 0) :="00000000";
    signal B : STD_LOGIC_VECTOR (7 downto 0):= "00000000";
    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal AmodB : STD_LOGIC_VECTOR (7 downto 0);
    signal start : STD_LOGIC := '0';
    constant clock_period : time := 10 ns;

begin
    uut : top_module
        port map(
            A => A,
            B=> B,
            clock => clock,
            reset => reset,
            AmodB => AmodB,
            start => start
        );

    clock_process :process
    begin
        clock <= '1';
        wait for clock_period/2;
        clock <= '0';
        wait for clock_period/2;
    end process;
    
    stim_proc: process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        A<="01111101";
        B<="00001100";
        wait for clock_period;
        start<='1';
        wait for clock_period;
        start<='0';
        wait;
    end process;

end Behavioral;
