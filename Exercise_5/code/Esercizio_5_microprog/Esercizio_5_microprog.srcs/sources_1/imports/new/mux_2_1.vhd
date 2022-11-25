----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
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

entity mux_2_1 is
    Port ( x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           load : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end mux_2_1;

architecture dataflow of mux_2_1 is

begin
    y <= x0 when load ='0' else
         x1 when load = '1';
    
end dataflow;
