----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:50:18
-- Design Name: 
-- Module Name: SystemB - Behavioral
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

entity SystemB is
    Port (
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        input : in STD_LOGIC_VECTOR(7 downto 0);
        B_ready : in STD_LOGIC;
        B_received : out STD_LOGIC;
        w1 : out STD_LOGIC_VECTOR(15 downto 0);
        w2 : out STD_LOGIC_VECTOR(15 downto 0) );
end SystemB;

architecture structural of SystemB is
    -- Stati del sistema B
    type state is (idle, wait_ready, pick_data);
    signal stato_corrente : state := idle;
    -- Segnali interni
    signal y_temp : std_logic_vector(15 downto 0) := (others=>'0');
    signal input1, input2 : std_logic_vector(15 downto 0) := (others=>'0');
    signal input_temp1, input_temp2 :std_logic_vector(15 downto 0) := (others=>'0');
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
    input1<=input_temp1;
    input2<=input_temp2;
    registro_1 : registro
        port map (
            D=>input1,
            clk=>clock,
            rst=>reset,
            en=>'1',
            o=>w1
        );
    registro_2 : registro
        port map (
            D=>input2,
            clk=>clock,
            rst=>reset,
            en=>'1',
            o=>w2
        );
    UC_B : process(clock, start, reset)
        variable bit_count : integer range 0 to 4 := 0;
    begin
        B_received<='0';
        if (reset='1') then
            bit_count:=1;
            stato_corrente<=idle;
        elsif (start='1') then
            stato_corrente<=wait_ready;
        elsif (clock'event and clock='1') then
            case stato_corrente is
                when idle =>
                    stato_corrente<=idle;
                when wait_ready =>
                    if (B_ready='0') then
                        stato_corrente<=wait_ready;
                    elsif (B_ready='1') then
                        stato_corrente<=pick_data;
                        bit_count:=bit_count+1;
                    end if;
                when pick_data =>
                    case bit_count is
                        when 0 => NULL;
                        when 1 => input_temp1(7 downto 0)<=input;
                        when 2 => input_temp1 (15 downto 8)<=input;
                        when 3 => input_temp2(7 downto 0)<=input;
                        when 4 => input_temp2(15 downto 8)<=input;
                    end case;
                    B_received<='1';
                    if (bit_count=4) then
                        stato_corrente<=idle;
                        B_received<='0';
                    elsif (B_ready='0') then
                        stato_corrente<=wait_ready;
                    else
                        stato_corrente<=pick_data;
                    end if;
            end case;
        end if;
    end process;
end Structural;


