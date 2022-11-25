----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2022 10:35:58
-- Design Name: 
-- Module Name: decoder_2_4_tb - decoder_2_4
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

entity decoder_2_4_tb is

end decoder_2_4_tb;

architecture decoder_2_4 of decoder_2_4_tb is

    component decoder_2_4
        Port ( a : in STD_LOGIC;
             b : in STD_LOGIC;
             e : in STD_LOGIC;
             o : out STD_LOGIC_VECTOR(3 downto 0)
            );
    end component;

    signal a: STD_LOGIC;
    signal b: STD_LOGIC;
    signal e: STD_LOGIC;
    signal o: STD_LOGIC_VECTOR(3 downto 0) ;



begin
    uut: decoder_2_4 port map ( a => a,
                 b => b,
                 e => e,
                 o => o );
    stimulus: process
    begin
        -- Put initialisation code here
        wait for 10 ns;
        a <= '0';
        b <= '0';
        e <= '1';
        assert o="0001";

        wait for 10 ns;
        a <= '1';
        b <= '0';
        e <= '1';
        assert o="0010";

        wait for 10 ns;
        a <= '0';
        b <= '1';
        e <= '1';
        assert o="0100";

        wait for 10 ns;
        a <= '1';
        b <= '1';
        e <= '1';
        assert o="1000";

        wait;
    end process;

end;



