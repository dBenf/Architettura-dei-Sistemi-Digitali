----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2022 12:21:06
-- Design Name: 
-- Module Name: flip_flop_D_mod - Behavioral
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

entity flip_flop_D is
    Port ( clk : in std_logic;
         reset : in std_logic;
         en : in std_logic;
         data : in std_logic;
         output : out std_logic);
end flip_flop_D;

architecture Behavioral of flip_flop_D is

begin
    process(clk)
    begin
        if(reset = '1') then
            output <= '0';
        elsif(clk'event and clk = '0' and en ='1') then
            output <= data;
        end if;
    end process;
    
end Behavioral;
