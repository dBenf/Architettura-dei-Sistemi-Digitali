----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2022 13:42:56
-- Design Name: 
-- Module Name: registro_scorrimento_tb - Behavioral
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

entity registro_scorrimento_tb is
end registro_scorrimento_tb;

architecture testbench of registro_scorrimento_tb is

    component registro_scorrimento is
        Port ( selection : in std_logic_vector (1 downto 0);
             x : in std_logic;
             clock : in std_logic;
             sh : in std_logic := '0';
             reset : in std_logic := '0';
             load : in std_logic := '0';
             A : in std_logic_vector (3 downto 0);
             y : out std_logic);
    end component;
    
    signal selection : STD_LOGIC_VECTOR (0 to 1);
    signal x : STD_LOGIC; 
    signal clock : STD_LOGIC; 
    signal sh : STD_LOGIC; 
    signal reset : STD_LOGIC; 
    signal load : STD_LOGIC; 
    signal A : STD_LOGIC_VECTOR (0 to 3); 
    signal y : STD_LOGIC; 
    
    constant clk_period : time := 10 ns;
    
begin
    uut : registro_scorrimento
        port map(
            selection => selection,
            x => x,
            clock => clock,
            sh => sh,
            reset => reset,
            load => load,
            A => A,
            y => y
        );
        
    clk_process : process
    begin
        clock <= '0';
        wait for clk_period/2;
        clock <= '1';
        wait for clk_period/2;
    end process;
    
    sh_process : process
    begin
        sh <= '0';
        wait for clk_period;
        sh <= '1';
        wait for 6*clk_period;
    end process;
    
    stimulus : process
    begin
        wait for clk_period;    
        reset <='1';
        wait for clk_period;
        reset <='0';
        
        --Prova Modalita 1
        wait for clk_period;
        A<="1001";
        load <='1';
        wait for clk_period;
        load <='0';
        
        --Scorrimento a sinistra 00
        selection<="00";
        wait for 5*clk_period;
        
        --Prova Modalita 2
        wait for clk_period;
        A<="1010";
        load <='1';
        
        wait for clk_period;
        load <='0';
        --Scorrimento a destra 01
        selection<="01";
        wait for 5*clk_period;
        
        --Prova Modalita 3
        wait for clk_period;
        A<="1110";
        load <='1';
        wait for clk_period;
        load <='0';
        
        --Scorrimento circolare a sinistra 10
        selection<="10";
        wait for 5*clk_period;
        
        --Prova Modalita 4
        wait for clk_period;
        A<="1000";
        load <='1';
        wait for clk_period;
        load <='0';
        
        --Scorrimento a sinistra con x 11
        x<='1';
        selection<="11";
        wait for 5*clk_period;
        reset <= '1';
        wait for clk_period;
        reset <='0';
        wait;
    end process;

end testbench;
