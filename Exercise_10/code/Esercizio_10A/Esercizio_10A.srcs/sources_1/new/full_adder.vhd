----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 12:31:25
-- Design Name: 
-- Module Name: full_adder - Dataflow
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

entity full_adder is
    Port(
        in_0: in STD_LOGIC;
        in_1: in STD_LOGIC;
        c_in: in STD_LOGIC;
        c_out: out STD_LOGIC;
        sum: out STD_LOGIC
    );  
end full_adder;

architecture Dataflow of full_adder is
begin
    sum <= in_0 XOR in_1 XOR c_in;
    c_out <= (in_0 AND in_1) OR (c_in AND (in_0 XOR in_1));
end Dataflow;