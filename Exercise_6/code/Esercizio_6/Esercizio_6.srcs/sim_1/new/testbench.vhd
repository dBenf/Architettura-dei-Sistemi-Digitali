----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:59:33
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
end testbench;

architecture Behavioral of testbench is
    component TopModule
        port(
            clock : in  std_logic;
            reset : in  std_logic;
            start : in  std_logic;
            input1 : in  std_logic_vector(15 downto 0);
            input2 : in  std_logic_vector(15 downto 0);
            output1 : out  std_logic_vector(15 downto 0);
            output2 : out  std_logic_vector(15 downto 0)
        );
    end component;


    --Inputs
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal start : std_logic := '0';
    signal A_input1 : std_logic_vector(15 downto 0) := "0011110011000011" ;
    signal A_input2 : std_logic_vector(15 downto 0) := "1010101001010101" ;

    --Outputs
    signal B_output1 : std_logic_vector(15 downto 0);
    signal B_output2 : std_logic_vector(15 downto 0);

    -- Clock period definitions
    constant clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: TopModule port map (
            clock => clock,
            reset => reset,
            start => start,
            input1 => A_input1,
            input2 => A_input2,
            output1 => B_output1,
            output2 => B_output2
        );


    clock_process :process
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;
        start<='1';
        wait for clock_period;
        start<='0';
        wait for clock_period;
        wait;
    end process;


end Behavioral;
