----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: sottrattore - structural
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

entity sottrattore is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         carry : in STD_LOGIC;
         ris : out STD_LOGIC_VECTOR (7 downto 0);
         cout : out STD_LOGIC :='0');
end sottrattore;

architecture structural of sottrattore is

    signal c_i: std_logic_vector(0 to 6) := (others => '0');
    signal B_comp: std_logic_vector(7 downto 0) := (others =>'0');
    component fullAdder is
        Port (
            A: in std_logic;
            B: in std_logic;
            c_in: in std_logic;
            c_out: out std_logic;
            s: out std_logic
        );
    end component;

begin
    B_comp <= not B; -- mi serve il negato per fare il complemento a 2
    --istanziazione del primo full adder
    F_Adder_0: fullAdder
        port map(
            A=>A(0),
            B=>B_comp(0),
            c_in=>carry,
            c_out=>c_i(0),
            s=>ris(0)
        );
    --istanziazione dei 6 full adder interni
    FA: for i in 1 to 6 generate
        F_Adder_I: fullAdder
            port map(
                A => A(i),
                B => B_comp(i),
                c_in => c_i(i-1),
                c_out => c_i(i),
                s => ris(i)
            );
    end generate;
    --istanziazione del full adder finale
    F_Adder_7: fullAdder
        port map(
            A=>A(7),
            B=>B_comp(7),
            c_in=>c_i(6),
            c_out=>cout,
            s=>ris(7)
        );

end structural;
