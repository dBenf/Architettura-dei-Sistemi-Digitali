----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 18:10:11
-- Design Name: 
-- Module Name: rete_comb - Behavioral
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

entity rete_comb is
    Port ( i : in STD_LOGIC;
           xp : in std_logic_vector(2 downto 0);
           x : out std_logic_vector(2 downto 0);
           y : out STD_LOGIC);
end rete_comb;

architecture dataflow of rete_comb is

begin
    x(0) <= ((not xp(0)) AND i) OR (xp(1) AND i);
    x(1) <= (xp(0) AND (not i)) OR (xp(1) AND i) OR ((not xp(0)) AND xp(2));
    x(2) <= ((not xp(1)) AND xp(0) AND i) OR (xp(1) AND (not xp(0)) AND i);
    y <= (xp(1) AND xp(0) AND (not i)) OR (xp(2) AND xp(0) AND (not i));

end dataflow;
