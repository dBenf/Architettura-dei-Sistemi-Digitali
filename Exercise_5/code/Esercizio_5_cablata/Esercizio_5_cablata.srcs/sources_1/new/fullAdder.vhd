----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: fullAdder - dataflow
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

entity fullAdder is
    Port ( A : in STD_LOGIC;
         B : in STD_LOGIC;
         c_in : in STD_LOGIC := '0';
         c_out : out STD_LOGIC := '0';
         s : out STD_LOGIC := '0');
end fullAdder;

architecture dataflow of fullAdder is

begin
    s <= A xor B xor c_in;
    c_out <= (A and B) or (c_in and (A xor B));
end dataflow;
