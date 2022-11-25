----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2022 11:07:14
-- Design Name: 
-- Module Name: riconoscitore - Behavioral
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

entity riconoscitore is
    Port( i : in std_logic;
         clock : in std_logic;
         y : out std_logic;
         reset : in std_logic
        );
end riconoscitore;

architecture structural of riconoscitore is
    component memoria is
        Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             xp : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component rete_comb is
        Port ( x : out STD_LOGIC_VECTOR (2 downto 0);
             i : in STD_LOGIC;
             y : out STD_LOGIC;
             xp : in STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component flipflopD is
        Port ( d : in STD_LOGIC;
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             o : out STD_LOGIC);
    end component;

    signal x_comb : std_logic_vector(2 downto 0);
    signal xp_in : std_logic_vector(2 downto 0);
    signal in_buff : std_logic := '0';

begin
    RC : rete_comb
        port map(
            x => xp_in,
            xp => x_comb,
            i => i,
            y => in_buff
            );
    MEM : memoria
        port map(
            clock => clock,
            reset => reset,
            x => xp_in,
            xp => x_comb
            );
    BUFF : flipflopD
        port map(
            clock => clock,
            reset => reset,
            d => in_buff,
            o => y
            );

end structural;
