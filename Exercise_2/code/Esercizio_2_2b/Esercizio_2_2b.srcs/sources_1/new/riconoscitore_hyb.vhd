----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 18:11:37
-- Design Name: 
-- Module Name: riconoscitore_hyb - Structural
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

entity riconoscitore_hyb is
    Port ( i : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         y : out STD_LOGIC);
end riconoscitore_hyb;

architecture Structural of riconoscitore_hyb is

    component rete_comb is
        Port ( i : in STD_LOGIC;
             xp : in std_logic_vector(2 downto 0);
             x : out std_logic_vector(2 downto 0);
             y : out STD_LOGIC);
    end component;

    component memoria is
        Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             x : in STD_LOGIC_VECTOR (2 downto 0);
             xp : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component flipflopD is
        Port ( d : in STD_LOGIC;
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             o : out STD_LOGIC);
    end component;

    signal x_in_mem : std_logic_vector(2 downto 0);
    signal x_out_mem : std_logic_vector(2 downto 0);
    signal temp_out : std_logic :='0';

begin
    MEM : memoria
        port map(
            clock => clock,
            reset => reset,
            x => x_in_mem,
            xp => x_out_mem
        );

    RC : rete_comb
        port map(
            i => i,
            y => temp_out,
            xp => x_out_mem,
            x => x_in_mem
        );
        
    FFout : flipflopD
        port map(
            d => temp_out,
            clock => clock,
            reset => reset,
            o => y
        );

end Structural;
