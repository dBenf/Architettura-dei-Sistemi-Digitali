----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:50:18
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port (
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        inputA : in STD_LOGIC_VECTOR(3 downto 0);
        outputB : out STD_LOGIC_VECTOR(7 downto 0);
        A_ready : in STD_LOGIC;
        A_received : out STD_LOGIC;
        B_ready : out STD_LOGIC;
        B_received : in STD_LOGIC);
end ControlUnit;

architecture structural of ControlUnit is
    -- Stati dell'unità FSM - A
    type statoA is (idle, A_wait_ready, A_send_data, A_wait_picked_data_from_B, wait_next_word_from_A);
    signal stato_correnteA : statoA := idle;
    -- Stati dell'unità FSM - B
    type statoB is (idle, B_wait_buffer_full, B_can_pick_data_from_buffer, wait_B_registers_not_full, wait_for_data_picked_from_B, wait_for_next_word);
    signal stato_correnteB : statoB := idle;
    -- Segnali interni
    signal full,picked : std_logic := '0';
    signal in_buffer : std_logic_vector(15 downto 0) := (others=>'0');
    signal out_buffer : std_logic_vector(15 downto 0) := (others=>'0');
    signal out_temp : std_logic_vector(7 downto 0) := (others=>'0');
    -- Componenti 
    component registro is
        port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            en: in STD_LOGIC;
            o : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
begin
    outputB<=out_temp;
    buffer_C : registro
        port map (
            D=>in_buffer,
            clk=>clock,
            rst=>reset,
            en=>'1',
            o=>out_buffer
        );
    fsm_A : process (clock, reset, start)
        variable bit_count : integer range 0 to 8 := 0;
    begin
        if (reset='1') then
            bit_count:=1;
            stato_correnteA<=idle;
        elsif (start='1') then
            stato_correnteA<=A_wait_ready;
        elsif (clock'event and clock='0') then
            full<='0';
            case stato_correnteA is
                when idle =>
                    stato_correnteA<=idle;
                    A_received<='0';
                when A_wait_ready =>
                    A_received<='0';
                    if (A_ready='1') then
                        bit_count:=bit_count+1;
                        stato_correnteA<=A_send_data;
                    else
                        stato_correnteA<=A_wait_ready;
                    end if;
                when A_send_data =>
                    case bit_count is
                        when 0 => NULL;
                        -- primo messaggio
                        when 1 => in_buffer(3 downto 0)<=inputA;
                        when 2 => in_buffer(7 downto 4)<=inputA;
                        when 3 => in_buffer(11 downto 8)<=inputA;
                        when 4 => in_buffer(15 downto 12)<=inputA;
                        -- secondo messaggio
                        when 5 => in_buffer(3 downto 0)<=inputA;
                        when 6 => in_buffer(7 downto 4)<=inputA;
                        when 7 => in_buffer(11 downto 8)<=inputA;
                        when 8 => in_buffer(15 downto 12)<=inputA;
                    end case;
                    if (bit_count=4 or bit_count=8) then
                        full<='1';
                        A_received<='0';
                        stato_correnteA<=A_wait_picked_data_from_B;
                    else
                        A_received<='1';
                        if (A_ready='0') then
                            stato_correnteA<=A_wait_ready;
                        else
                            stato_correnteA<=A_send_data;
                        end if;
                    end if;
                when A_wait_picked_data_from_B =>
                    full<='1';
                    if (picked='0') then
                        stato_correnteA<=A_wait_picked_data_from_B;
                    elsif (picked='1') then
                        stato_correnteA<=wait_next_word_from_A;
                        full<='0';
                    end if;
                when wait_next_word_from_A =>
                    full<='0';
                    A_received<='1';
                    if (A_ready='0') then
                        if(bit_count=8) then
                            stato_correnteA <= idle;
                            A_received <= '0';
                        else
                            stato_correnteA <= A_wait_ready;
                            A_received <= '0';
                        end if;
                    else
                        stato_correnteA <= wait_next_word_from_A;
                    end if;
            end case;
        end if;
    end process;

    fsm_B : process (clock, reset, start)
        variable bit_count : integer range 0 to 4 := 0;
    begin
        if (reset='1') then
            bit_count:=1;
            stato_correnteB<=idle;
        elsif (start='1') then
            stato_correnteB<=B_wait_buffer_full;
        elsif (clock'event and clock='0') then
            case stato_correnteB is
                when idle =>
                    stato_correnteB<=idle;
                    B_ready<='0';
                when B_wait_buffer_full =>
                    B_ready<='0';
                    if (full='1') then
                        stato_correnteB<=B_can_pick_data_from_buffer;
                    else
                        stato_correnteB<=B_wait_buffer_full;
                    end if;
                when B_can_pick_data_from_buffer =>
                    B_ready<='0';
                    if (B_received='0') then
                        bit_count:=bit_count+1;
                        case bit_count is
                            when 0 => NULL;
                            -- primo messaggio
                            when 1 => out_temp<=out_buffer(7 downto 0);
                            when 2 => out_temp<=out_buffer(15 downto 8);
                            -- secondo messaggio
                            when 3 => out_temp<=out_buffer(7 downto 0);
                            when 4 => out_temp<=out_buffer(15 downto 8);
                        end case;
                        if (bit_count=2 or bit_count=4) then
                            stato_correnteB<=wait_B_registers_not_full;
                            picked<='1';
                        else
                            stato_correnteB<=wait_for_data_picked_from_B;
                            B_ready<='1';
                        end if;
                    else
                        stato_correnteB<=B_can_pick_data_from_buffer;
                    end if;
                when wait_for_data_picked_from_B =>
                    if (B_received='1') then
                        stato_correnteB<=B_can_pick_data_from_buffer;
                    else
                        stato_correnteB<=wait_for_data_picked_from_B;
                    end if;
                when wait_B_registers_not_full =>
                    picked<='1';
                    if (full='0') then
                        stato_correnteB<=wait_for_next_word;
                        picked<='0';
                        B_ready<='1';
                    else
                        stato_correnteB<=wait_B_registers_not_full;
                    end if;
                when wait_for_next_word =>
                    B_ready<='1';
                    if (B_received='0') then
                        stato_correnteB<=wait_for_next_word;
                    else
                        if (bit_count=4) then
                            stato_correnteB<=idle;
                            B_ready<='0';
                            picked<='0';
                        else
                            stato_correnteB<=B_wait_buffer_full;
                            B_ready<='0';
                            picked<='0';
                        end if;
                    end if;
            end case;
        end if;
    end process;

end structural;
