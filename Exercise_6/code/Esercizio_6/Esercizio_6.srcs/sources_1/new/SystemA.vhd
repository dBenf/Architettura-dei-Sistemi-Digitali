----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:50:18
-- Design Name: 
-- Module Name: SystemA - Behavioral
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

entity SystemA is
    Port (
        clock : in STD_LOGIC;
        start : in STD_LOGIC;
        reset : in STD_LOGIC;
        A_received : in STD_LOGIC;
        A_ready : out STD_LOGIC;
        w1 : in STD_LOGIC_VECTOR (15 downto 0);
        w2 : in STD_LOGIC_VECTOR (15 downto 0);
        o : out STD_LOGIC_VECTOR (3 downto 0)
    );
end SystemA;

architecture structural of SystemA is
    -- Stati del sistema A
    type state is (idle, send_data, wait_received);
    signal stato_corrente : state;
    -- Segnali interni
    signal out_temp1, out_temp2 : std_logic_vector(15 downto 0);
    signal out_data_temp : std_logic_vector(3 downto 0) := (others=>'0');
    -- Componenti
    component registro is
        port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            en : in STD_LOGIC;
            o : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
begin

    o<=out_data_temp;

    registro_1 : registro
        port map (
            D=>w1,
            clk=>clock,
            rst=>reset,
            en=>'1',
            o=>out_temp1
        );
    registro_2 : registro
        port map (
            D=>w2,
            clk=>clock,
            rst=>reset,
            en=>'1',
            o=>out_temp2
        );
    UC_A : process(clock,start,reset)
        variable bit_count : integer range 0 to 8 := 1;
    begin
        if (reset='1') then
            bit_count:=1;
            stato_corrente<=idle;
        elsif (start='1') then
            stato_corrente<=send_data;
        elsif (clock'event and clock='1') then
            case stato_corrente is
                when idle =>
                    stato_corrente<=idle;
                    A_ready<='0';
                when send_data =>
                    A_ready<='0';
                    if (A_received='0')then
                        case bit_count is
                            when 0 => NULL;
                            when 1 => out_data_temp<=out_temp1(3 downto 0);
                            when 2 => out_data_temp<=out_temp1(7 downto 4);
                            when 3 => out_data_temp<=out_temp1(11 downto 8);
                            when 4 => out_data_temp<=out_temp1(15 downto 12);
                            when 5 => out_data_temp<=out_temp2(3 downto 0);
                            when 6 => out_data_temp<=out_temp2(7 downto 4);
                            when 7 => out_data_temp<=out_temp2(11 downto 8);
                            when 8 => out_data_temp<=out_temp2(15 downto 12);
                        end case;
                        stato_corrente<=wait_received;
                        A_ready<='1';
                    else
                        stato_corrente<=send_data;
                    end if;
                when wait_received =>
                    if (A_received='1' AND bit_count/=8) then
                        stato_corrente<=send_data;
                        bit_count:=bit_count+1;
                    elsif (A_received='1' AND bit_count=8) then
                        stato_corrente<=idle;
                    else
                        stato_corrente<=wait_received;
                    end if;
            end case;
        end if;
    end process ;
end structural;
