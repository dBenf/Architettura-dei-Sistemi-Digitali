----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 18:38:44
-- Design Name: 
-- Module Name: op_AND - Behavioral
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

entity op_AND is
    Generic ( n : positive := 2);
    Port ( a : in STD_LOGIC_VECTOR(n-1 downto 0);
         c : out STD_LOGIC);
end op_AND;

architecture Behavioral of op_AND is

begin
    and_f : process(a)
        variable r: std_logic;
    begin
        r:='1';
        for i in 0 to n-1 loop
            r:=r and a(i);
        end loop;
        c<=r;
    end process;

end Behavioral;
