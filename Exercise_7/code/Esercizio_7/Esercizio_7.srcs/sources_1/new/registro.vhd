----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 11:50:44
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registro is
    generic(
        N : positive := 8 );
    Port ( clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         en : in STD_LOGIC;
         D : in STD_LOGIC_VECTOR (N-1 downto 0);
         D_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end registro;

architecture Behavioral of registro is

    signal out_temp : STD_LOGIC_VECTOR (N-1 downto 0) := (others=>'0');

begin
    --Processo di funzionamento del registro
    process(clock, reset)
    begin
        if (reset = '1') then
            out_temp<=(others=>'0');
        elsif(clock'event AND clock='1') then
            if (en='1') then
                out_temp<=D;
            end if;
        end if;
    end process;
    
    --Uscita concorrente
    D_out <= out_temp;

end Behavioral;
