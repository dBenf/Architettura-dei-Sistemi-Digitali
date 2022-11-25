----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2022 12:21:06
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer is
    generic(
        n : positive := 2
    );
    Port ( i : in std_logic_vector(2**n downto 1);
         sel : in std_logic_vector(n-1 downto 0);
         o : out std_logic
        );
end multiplexer;

architecture dataflow of multiplexer is

begin
    o <= i(2**n - to_integer(unsigned(sel)));
end dataflow;
