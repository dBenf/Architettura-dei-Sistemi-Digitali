----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 18:48:52
-- Design Name: 
-- Module Name: flipflopD - Behavioral
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

entity flipflopD is
    Port ( d : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         o : out STD_LOGIC);
end flipflopD;

architecture Behavioral of flipflopD is

begin
    -- se metto solo clock e non solo reset, se varia il reset
    -- devo attendere che cambia il clock per vedere l'effetto
    process(clock)
    begin
        if (clock'event AND clock='1') then
            if (reset = '1') then
                o<='0';
            else
                o<=D;
            end if;
        end if;

    end process;

end Behavioral;
