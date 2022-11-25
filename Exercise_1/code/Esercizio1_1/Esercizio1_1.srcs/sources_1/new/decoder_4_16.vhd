----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2022 12:11:10
-- Design Name: 
-- Module Name: decoder_4_16 - Structural
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
--library xil_defaultlib;
--use xil_defaultlib.decoder_2_4;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_4_16 is
    Port ( x : in std_logic_vector (3 downto 0);
        e : in std_logic;
        y : out std_logic_vector (15 downto 0)
        );
end decoder_4_16;

architecture Structural of decoder_4_16 is
    signal enable0 : STD_LOGIC := '0';
    signal enable1 : STD_LOGIC := '0';
    signal enable2 : STD_LOGIC := '0';
    signal enable3 : STD_LOGIC := '0';
    
    component decoder_2_4 is
       Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           e : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
begin
    decoder0: decoder_2_4
    port map(
        e => e,
        a => x(3),
        b => x(2),
        o(0) => enable0,
        o(1) => enable1,
        o(2) => enable2,
        o(3) => enable3
    );
    
    decoder1: decoder_2_4
    port map(
        e => enable0,
        a => x(1),
        b => x(0),
        o(0) => y(0),
        o(1) => y(1),
        o(2) => y(2),
        o(3) => y(3)
    );
    
    decoder2: decoder_2_4
    port map(
        e => enable0,
        a => x(1),
        b => x(0),
        o(0) => y(4),
        o(1) => y(5),
        o(2) => y(6),
        o(3) => y(7)
    );
    
    decoder3: decoder_2_4
    port map(
        e => enable0,
        a => x(1),
        b => x(0),
        o(0) => y(8),
        o(1) => y(9),
        o(2) => y(10),
        o(3) => y(11)
    );
    
    decoder4: decoder_2_4
    port map(
        e => enable0,
        a => x(1),
        b => x(0),
        o(0) => y(12),
        o(1) => y(13),
        o(2) => y(14),
        o(3) => y(15)
    );
    
end Structural;
