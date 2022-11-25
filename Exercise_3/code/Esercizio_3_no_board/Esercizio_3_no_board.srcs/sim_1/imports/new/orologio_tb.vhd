----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2022 11:29:02
-- Design Name: 
-- Module Name: orologio_tb - testbench
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

entity orologio_tb is
end orologio_tb;

architecture testbench of orologio_tb is

    component orologio is
        Port (
            clock : in STD_LOGIC;
            set_s : in STD_LOGIC;
            set_m : in STD_LOGIC;
            set_h : in STD_LOGIC;
            input_s : in STD_LOGIC_VECTOR(5 downto 0);
            input_m : in STD_LOGIC_VECTOR(5 downto 0);
            input_h : in STD_LOGIC_VECTOR(4 downto 0);
            reset : in STD_LOGIC;
            y_time : out STD_LOGIC_VECTOR(16 downto 0)
        );
    end component;

    signal clock : STD_LOGIC;
    signal set_s : STD_LOGIC;
    signal set_m : STD_LOGIC;
    signal set_h : STD_LOGIC;
    signal input_s : STD_LOGIC_VECTOR(5 downto 0);
    signal input_m : STD_LOGIC_VECTOR(5 downto 0);
    signal input_h : STD_LOGIC_VECTOR(4 downto 0);
    signal reset : STD_LOGIC;
    signal y_time : STD_LOGIC_VECTOR(16 downto 0);
    constant clk_period : time := 20000 ps;

begin

    uut: orologio
        port map(
            clock => clock,
            set_s => set_s,
            set_m => set_m,
            set_h => set_h,
            input_s => input_s,
            input_m => input_m,
            input_h => input_h,
            reset => reset,
            y_time => y_time
        );

    clock_proc : process
    begin
        clock <= '0';
        wait for clk_period/2;
        clock <= '1';
        wait for clk_period/2;
    end process;


    stim_proc : process
    begin
        wait for clk_period*300;
        set_s <= '1';
        set_m <= '1';
        set_h <= '1';
        input_s <= "111011";
        input_m <= "111011";
        input_h <= "10111";
        wait for clk_period*300;
        set_s <= '0';
        set_m <= '0';
        set_h <= '0';
        wait;
    end process;

end testbench;
