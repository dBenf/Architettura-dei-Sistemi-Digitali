----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 18:21:50
-- Design Name: 
-- Module Name: Vector_tb - Behavioral
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

entity Vector_tb is
end Vector_tb;

architecture Behavioral of Vector_tb is
    component Vector is
        Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
             read_en : in STD_LOGIC_VECTOR (1 downto 0);
             mux_sel : in STD_LOGIC_VECTOR (1 downto 0);
             data_out : out STD_LOGIC_VECTOR (7 downto 0);
             clock : in STD_LOGIC;
             reset : in STD_LOGIC);
    end component;

    signal data_in :  STD_LOGIC_VECTOR (7 downto 0);
    signal read_en :  STD_LOGIC_VECTOR (1 downto 0);
    signal mux_sel : STD_LOGIC_VECTOR (1 downto 0);
    signal data_out :  STD_LOGIC_VECTOR (7 downto 0);
    signal clock :  STD_LOGIC;
    signal reset :  STD_LOGIC;
    
    constant clk_per : TIME := 10 ns;
begin
    
    uut : Vector
    port map(
        data_in => data_in,
        read_en => read_en,
        mux_sel => mux_sel,
        data_out => data_out,
        clock => clock,
        reset => reset
    );
    
    clk : process
    begin
        clock <= '1';
        wait for clk_per/2;
        clock <= '0';
        wait for clk_per/2;
    end process;
    
    test : process
    begin
        reset <= '1';
        wait for 2*clk_per;
        reset <= '0';
        
--        data_in <= "01001101";
--        read_en <= "11";
--        wait for clk_per;
--        mux_sel <= "11";
--        wait for clk_per;
        
--        data_in <= "10010011";
--        read_en <= "10";
--        wait for clk_per;
--        mux_sel <= "10";
--        wait for clk_per;
        
--        data_in <= "00110101";
--        read_en <= "01";
--        wait for clk_per;
--        mux_sel <= "01";
--        wait for 2*clk_per;
--        reset <= '1';
--        data_in <= "00000000";
--        read_en <= "00";
--        mux_sel <= "00";

        wait for clk_per;
        data_in <= "01001101";
        read_en <= "01";
        wait for clk_per;
        data_in <= "10010011";
        read_en <= "10";
        wait for clk_per;
        data_in <= "00110101";
        read_en <= "11";
        wait for clk_per;
        read_en <= "00";
        
        wait for 3*clk_per;
        mux_sel <= "01";
        wait for 2*clk_per;
        mux_sel <= "10";
        wait for 2*clk_per;
        mux_sel <= "11";
        wait;
    end process;

end Behavioral;
