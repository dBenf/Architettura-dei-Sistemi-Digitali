----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 22:54:09
-- Design Name: 
-- Module Name: divisore_tb - testbench
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

entity divisore_tb is
end divisore_tb;

architecture testbench of divisore_tb is

    COMPONENT Divisore_NR
        PORT(
            divisore : IN  std_logic_vector(3 downto 0);
            dividendo : IN  std_logic_vector(3 downto 0);
            start : IN  std_logic;
            RST : IN  std_logic;
            CLK : IN  std_logic;
            OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    --Inputs
    signal divisore : std_logic_vector(3 downto 0) := (others => '0');
    signal dividendo : std_logic_vector(3 downto 0) := (others => '0');
    signal start : std_logic := '0';
    signal RST : std_logic := '0';
    signal CLK : std_logic := '0';

    --Outputs
    signal OUTPUT : std_logic_vector(7 downto 0);

    -- Clock period definitions
    constant CLK_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Divisore_NR PORT MAP (
            divisore => divisore,
            dividendo => dividendo,
            start => start,
            RST => RST,
            CLK => CLK,
            OUTPUT => OUTPUT
        );

    -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;

        wait for CLK_period*10;

        -- insert stimulus here 
        dividendo  <= "1000";
        divisore <= "0011";
        wait for 20 ns;
        RST <= '1';
        wait for  20 ns;
        RST <= '0';
        wait for 20 ns;
        start <= '1';
        wait for 20 ns;
        start <= '0';

        wait;
    end process;

end testbench;
