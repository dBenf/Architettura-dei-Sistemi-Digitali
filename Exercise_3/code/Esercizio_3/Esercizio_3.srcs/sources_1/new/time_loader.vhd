----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2022 17:21:19
-- Design Name: 
-- Module Name: time_loader - Behavioral
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

entity time_loader is
    Port (
        x : in STD_LOGIC_VECTOR(5 downto 0);
        set : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        sec_time: out STD_LOGIC_VECTOR(5 downto 0);
        min_time: out STD_LOGIC_VECTOR(5 downto 0);
        hou_time: out STD_LOGIC_VECTOR(4 downto 0);
        load : out STD_LOGIC
    );
end time_loader;

architecture Behavioral of time_loader is

    type state is (S0, S1, S2, S3, S4, S5);

    signal current_state : state := S0;
    signal load_temp : STD_LOGIC := '0';

    signal reg_s_temp : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    signal reg_m_temp : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    signal reg_h_temp : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');

begin
    load <= load_temp;
    sec_time <= reg_s_temp;
    min_time <= reg_m_temp;
    hou_time <= reg_h_temp;
    p : process(clk, reset)
    begin
        if(reset = '1') then
            current_state <= S0;
            load_temp <= '0';
        elsif (clk'event AND clk = '1') then
            case current_state is
                when S0 =>
                    if(set = '0') then
                        current_state <= S0;
                        load_temp <= '0';
                    else
                        reg_h_temp <= '0' & x(3 downto 0);
                        current_state <= S1;
                        load_temp <= '0';
                    end if;
                when S1 =>          --Attesa pulsante
                    if(set = '0') then
                        current_state <= S2;
                        load_temp <= '0';
                    else
                        current_state <= S1;
                    end if;
                when S2 =>          --Caricamento minuti
                    if(set = '0') then
                        current_state <= S2;
                        load_temp <= '0';
                    else
                        reg_m_temp <= x;
                        current_state <= S3;
                        load_temp <= '0';
                    end if;
                when S3 =>          --Attesa pulsante
                    if(set = '0') then
                        current_state <= S4;
                        load_temp <= '0';
                    else
                        current_state <= S3;
                    end if;
                when S4 =>          --Caricamento secondi
                    if(set = '0') then
                        current_state <= S4;
                        load_temp <= '0';
                    else
                        reg_s_temp <= x;
                        current_state <= S5;
                        load_temp <= '1';
                    end if;
                when S5 =>          --Attesa pulsante
                    if(set = '0') then
                        current_state <= S0;
                        load_temp <= '0';
                    else
                        current_state <= S5;
                        load_temp <= '0';
                    end if;
                when others =>
                    current_state <= S0;
                    load_temp <= '0';
            end case;
        end if;
    end process;


end Behavioral;
