----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 12:30:26
-- Design Name: 
-- Module Name: RippleCarryAdder - Behavioral
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

entity RippleCarryAdder is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
         B : in STD_LOGIC_VECTOR (15 downto 0);
         carry : in STD_LOGIC;
         ris : out STD_LOGIC_VECTOR (15 downto 0);
         cout : out STD_LOGIC);
end RippleCarryAdder;

architecture structural of RippleCarryAdder is
    --Carry interni
    signal c_i: std_logic_vector(0 to 14) := (others => '0');
    -- Full Adder interni
    component fullAdder is
        Port (
            A: in std_logic;
            B: in std_logic;
            c_in: in std_logic;
            c_out:out std_logic;
            s: out std_logic
        );
    end component;
begin
    --ISTANZIAZIONE FULL ADDER
    -- Full Adder 0
    F_Adder_0: fullAdder
        port map(
            A=>A(0),
            B=>B(0),
            c_in=>carry,
            c_out=>c_i(0),
            s=>ris(0)
        );
    -- Full Adder 1-14
    F_Adder : for i in 1 to 14 generate
        f_add_i : fullAdder
            port map(
                A=>A(i),
                B=>B(i),
                c_in=>c_i(i-1),
                c_out=>c_i(i),
                s=>ris(i)
            );
    end generate;
    -- Full Adder 15
    F_Adder_15 : fullAdder
        port map(
            A=>A(15),
            B=>B(15),
            c_in=>c_i(14),
            c_out=>cout,
            s=>ris(15)
        );
end structural;
