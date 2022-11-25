----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2022 16:59:06
-- Design Name: 
-- Module Name: orologio_board - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity orologio_board is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        sec : in std_logic_vector(5 downto 0);
        min : in std_logic_vector(5 downto 0);
        hour : in std_logic_vector(5 downto 0);
        anodi : out std_logic_vector(7 downto 0);
        catodi : out std_logic_vector(7 downto 0)
    );
end orologio_board;

architecture Behavioral of orologio_board is

    constant zero   : std_logic_vector(6 downto 0) := "1000000";
    constant one    : std_logic_vector(6 downto 0) := "1111001";
    constant two    : std_logic_vector(6 downto 0) := "0100100";
    constant three  : std_logic_vector(6 downto 0) := "0110000";
    constant four   : std_logic_vector(6 downto 0) := "0011001";
    constant five   : std_logic_vector(6 downto 0) := "0010010";
    constant six    : std_logic_vector(6 downto 0) := "0000010";
    constant seven  : std_logic_vector(6 downto 0) := "1111000";
    constant eight  : std_logic_vector(6 downto 0) := "0000000";
    constant nine   : std_logic_vector(6 downto 0) := "0010000";
    constant none   : std_logic_vector(6 downto 0) := "0111111";

    signal dots : std_logic;
    signal clk_counter : natural range 0 to 50000000 := 0;
    signal an_number : natural range 0 to 6 := 0;

begin

    refresh : process(clock,reset,clk_counter)
    begin
        if (reset = '0') then
            clk_counter <= 0;
        elsif (clock'event and clock='1') then
            clk_counter <= clk_counter + 1;
            if clk_counter >= 100000 then
                clk_counter <= 0;
                an_number <= an_number + 1;
                if an_number > 5 then
                    an_number <= 0;
                end if;
            end if;
        end if;
    end process;

    output: process(an_number, sec, min, hour)
    begin
        case an_number is
            when 0 =>
                anodi <= "11111110"; dots <= '1';
                case to_integer(unsigned(sec)) is
                    when 0|10|20|30|40|50 => catodi <= dots & zero;
                    when 1|11|21|31|41|51 => catodi <= dots & one;
                    when 2|12|22|32|42|52 => catodi <= dots & two;
                    when 3|13|23|33|43|53 => catodi <= dots & three;
                    when 4|14|24|34|44|54 => catodi <= dots & four;
                    when 5|15|25|35|45|55 => catodi <= dots & five;
                    when 6|16|26|36|46|56 => catodi <= dots & six;
                    when 7|17|27|37|47|57 => catodi <= dots & seven;
                    when 8|18|28|38|48|58 => catodi <= dots & eight;
                    when 9|19|29|39|49|59 => catodi <= dots & nine;
                    when others => catodi <= dots & none;
                end case;
            when 1 =>
                anodi <= "11111101"; dots <= '1';
                case to_integer(unsigned(sec)) is
                    when 0 to 9 => catodi <= dots & zero;
                    when 10 to 19 => catodi <= dots & one;
                    when 20 to 29 => catodi <= dots & two;
                    when 30 to 39 => catodi <= dots & three;
                    when 40 to 49 => catodi <= dots & four;
                    when 50 to 59 => catodi <= dots & five;
                    when others => catodi <= dots & none;
                end case;
            when 2 =>
                anodi <= "11111011"; dots <= '0';
                case to_integer(unsigned(min)) is
                    when 0|10|20|30|40|50 => catodi <= dots & zero;
                    when 1|11|21|31|41|51 => catodi <= dots & one;
                    when 2|12|22|32|42|52 => catodi <= dots & two;
                    when 3|13|23|33|43|53 => catodi <= dots & three;
                    when 4|14|24|34|44|54 => catodi <= dots & four;
                    when 5|15|25|35|45|55 => catodi <= dots & five;
                    when 6|16|26|36|46|56 => catodi <= dots & six;
                    when 7|17|27|37|47|57 => catodi <= dots & seven;
                    when 8|18|28|38|48|58 => catodi <= dots & eight;
                    when 9|19|29|39|49|59 => catodi <= dots & nine;
                    when others => catodi <= dots & none;
                end case;
            when 3 =>
                anodi <= "11110111"; dots <= '1';
                case to_integer(unsigned(min)) is
                    when 0 to 9 => catodi <= dots & zero;
                    when 10 to 19 => catodi <= dots & one;
                    when 20 to 29 => catodi <= dots & two;
                    when 30 to 39 => catodi <= dots & three;
                    when 40 to 49 => catodi <= dots & four;
                    when 50 to 59 => catodi <= dots & five;
                    when others => catodi <= dots & none;
                end case;
            when 4 =>
                anodi <= "11101111"; dots <= '0';
                case to_integer(unsigned(hour)) is
                    when 0|10|20|30|40|50 => catodi <= dots & zero;
                    when 1|11|21|31|41|51 => catodi <= dots & one;
                    when 2|12|22|32|42|52 => catodi <= dots & two;
                    when 3|13|23|33|43|53 => catodi <= dots & three;
                    when 4|14|24|34|44|54 => catodi <= dots & four;
                    when 5|15|25|35|45|55 => catodi <= dots & five;
                    when 6|16|26|36|46|56 => catodi <= dots & six;
                    when 7|17|27|37|47|57 => catodi <= dots & seven;
                    when 8|18|28|38|48|58 => catodi <= dots & eight;
                    when 9|19|29|39|49|59 => catodi <= dots & nine;
                    when others => catodi <= dots & none;
                end case;
            when 5 =>
                anodi <= "11011111"; dots <= '1';
                case to_integer(unsigned(hour)) is
                    when 0 to 9 => catodi <= dots & zero;
                    when 10 to 19 => catodi <= dots & one;
                    when 20 to 23 => catodi <= dots & two;
                    when others => catodi <= dots & none;
                end case;
            when others => anodi <= "11111111"; dots <= '1'; catodi <= dots & none;
        end case;
    end process;


end Behavioral;
