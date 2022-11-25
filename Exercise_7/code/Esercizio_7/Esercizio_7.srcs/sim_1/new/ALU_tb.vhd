----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 13:51:51
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

    component ALU is
        Port ( comp_A : in STD_LOGIC_VECTOR (7 downto 0);
             comp_B : in STD_LOGIC_VECTOR (7 downto 0);
             start_ALU : in STD_LOGIC;
             acc_en : in STD_LOGIC;
             s_end : out STD_LOGIC;
             clock : in STD_LOGIC;
             mux_sel : out STD_LOGIC_VECTOR(1 downto 0);
             reset : in STD_LOGIC;
             partial_res : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    -- SEGNALI INTERNI
    signal comp_A :  STD_LOGIC_VECTOR (7 downto 0);
    signal comp_B :  STD_LOGIC_VECTOR (7 downto 0);
    signal start_ALU :  STD_LOGIC;
    signal acc_en :  STD_LOGIC;
    signal s_end :  STD_LOGIC;
    signal clock :  STD_LOGIC;
    signal mux_sel :  STD_LOGIC_VECTOR(1 downto 0);
    signal reset :  STD_LOGIC;
    signal partial_res :  STD_LOGIC_VECTOR (15 downto 0);

    -- COSTANTI
    constant clk_per : TIME := 10 ns;

begin
    uut : ALU
        port map(
            comp_A => comp_A,
            comp_B => comp_B,
            start_ALU => start_ALU,
            acc_en => acc_en,
            s_end => s_end,
            clock => clock,
            mux_sel => mux_sel,
            reset => reset,
            partial_res => partial_res
        );

    clk: process
    begin
        clock <= '0';
        wait for clk_per;
        clock <= '1';
        wait for clk_per;
    end process;
    
    test : process
    begin
        wait for 100ns;
        comp_A <= "01001101";
        comp_B <= "11011010";
        wait for 4*clk_per;
        start_ALU <= '1';
        wait for 4*clk_per;
        acc_en <= '1';
    end process;

end Behavioral;
