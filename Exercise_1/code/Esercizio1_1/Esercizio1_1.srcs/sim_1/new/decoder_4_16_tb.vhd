----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2022 11:46:47
-- Design Name: 
-- Module Name: decoder_4_16_tb - testbench
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

entity decoder_4_16_tb is
    --  Port ( );
end decoder_4_16_tb;

architecture testbench of decoder_4_16_tb is

    component decoder_4_16
        Port ( x : in std_logic_vector (3 downto 0);
             e : in std_logic;
             y : out std_logic_vector (15 downto 0)
            );
    end component;

    signal x: std_logic_vector (3 downto 0);
    signal e: std_logic:= '1';
    signal y: std_logic_vector (15 downto 0) ;

begin

    uut: decoder_4_16 port map ( x => x,
                 e => e,
                 y => y );

    stimulus: process
    begin

        x <= "0000";
        wait for 10 ns;
        assert y="0000000000000001";
        x <= "0001";
        wait for 10 ns;
        assert y="0000000000000010";
        x <= "0010";
        wait for 10 ns;
        assert y="0000000000000100";
        x <= "0011";
        wait for 10 ns;
        assert y="0000000000001000";
        x <= "0100";
        wait for 10 ns;
        assert y="0000000000010000";
        x <= "0101";
        wait for 10 ns;
        assert y="0000000000100000";
        x <= "0110";
        wait for 10 ns;
        assert y="0000000001000000";
        x <= "0111";
        wait for 10 ns;
        assert y="0000000010000000";
        x <= "1000";
        wait for 10 ns;
        assert y="0000000100000000";
        x <= "1001";
        wait for 10 ns;
        assert y="0000001000000000";
        x <= "1010";
        wait for 10 ns;
        assert y="0000010000000000";
        x <= "1011";
        wait for 10 ns;
        assert y="0000100000000000";
        x <= "1100";
        wait for 10 ns;
        assert y="0001000000000000";
        x <= "1101";
        wait for 10 ns;
        assert y="0010000000000000";
        x <= "1110";
        wait for 10 ns;
        assert y="0100000000000000";
        x <= "1111";
        wait for 10 ns;
        assert y="1000000000000000";
        wait;
    end process;


end testbench;
