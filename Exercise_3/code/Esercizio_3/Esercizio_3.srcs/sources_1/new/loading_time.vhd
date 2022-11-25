----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2022 20:05:07
-- Design Name: 
-- Module Name: loading_time - Behavioral
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

entity loading_time is
    generic(
        N : integer := 5
    );
    Port (
        x : in STD_LOGIC_VECTOR(N-1 downto 0);
        set : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        out_time: out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end loading_time;

architecture Behavioral of loading_time is

    signal valore : std_logic_vector(N-1 downto 0) := (others=>'0');

begin

    load : process(clk, reset, set)
    begin
        if (reset = '1') then
            valore <= (others=>'0');
        elsif (clk'event and clk='1') then
            valore <= x;
        end if;
    end process;
    
    out_time <= valore;

end Behavioral;
