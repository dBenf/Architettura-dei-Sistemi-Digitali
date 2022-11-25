----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 19:14:00
-- Design Name: 
-- Module Name: rete_comb - Structural
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
    Port ( x : out STD_LOGIC_VECTOR (2 downto 0);
         i : in STD_LOGIC;
         y : out STD_LOGIC;
         xp : in STD_LOGIC_VECTOR (2 downto 0));
end rete_comb;

architecture Structural of rete_comb is
    component op_AND is
        Generic ( n : positive := 2);
        Port ( a : in STD_LOGIC_VECTOR(n-1 downto 0);
             c : out STD_LOGIC);
    end component;
    component op_NOT is
        Port ( a : in STD_LOGIC;
             c : out STD_LOGIC);
    end component;
    component op_OR is
        Port ( a : in STD_LOGIC;
             b : in STD_LOGIC;
             c : out STD_LOGIC);
    end component;

    signal not_xp : std_logic_vector(2 downto 0) :=(others =>'0');
    signal not_i : std_logic :='0';
    signal temp1 : std_logic :='0';
    signal temp2 : std_logic :='0';

begin
    not_x0 : op_NOT
        Port map(
            a => xp(0),
            c => not_xp(0)
        );
    not_x1 : op_NOT
        Port map(
            a => xp(1),
            c => not_xp(1)
        );
    not_x2 : op_NOT
        Port map(
            a => xp(2),
            c => not_xp(2)
        );
    not_ing : op_NOT
        Port map(
            a => i,
            c => not_i
        );
    FF0 : op_AND generic map(3)
        Port map(
            a(0) => not_xp(0),
            a(1) => not_xp(1),
            a(2) => not_xp(2),
            c => x(0)
        );
    FF1_temp1 : op_AND generic map(2)
        Port map(
            a(0) => not_xp(1),
            a(1) => xp(0),
            c => temp1
        );
    FF1_temp2 : op_AND generic map(3)
        Port map(
            a(0) => not_xp(2),
            a(1) => not_xp(1),
            a(2) => not_i,
            c => temp2
        );
    FF1 : op_OR
        Port map(
            a => temp1,
            b => temp2,
            c => x(1)
        );
    FF2 : op_AND generic map(2)
        Port map(
            a(0) => xp(0),
            a(1) => xp(1),
            c => x(2)
        );
    Uscita : op_AND generic map(3)
        Port map(
            a(0) => not_xp(0),
            a(1) => xp(1),
            a(2) => i,
            c => y
        );
end Structural;
