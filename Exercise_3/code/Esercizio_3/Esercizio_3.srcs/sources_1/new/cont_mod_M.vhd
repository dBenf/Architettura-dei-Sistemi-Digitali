----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 19:02:59
-- Design Name: 
-- Module Name: cont_mod_M - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity cont_mod_M is
    generic(
        M : integer := 60 ;
        N : integer := 6
    );
    Port (
        clock : in STD_LOGIC;
        set : in STD_LOGIC;
        input : in std_logic_vector(N-1 downto 0);
        reset : in STD_LOGIC;
        count : out STD_LOGIC;
        y : out std_logic_vector(N-1 downto 0)
    );
end cont_mod_M;

architecture Behavioral of cont_mod_M is
    component flip_flop_T is
        Port ( d : in STD_LOGIC;
             clock : in STD_LOGIC;
             t : out STD_LOGIC;
             reset : in STD_LOGIC;
             load_en : in STD_LOGIC;
             start : in STD_LOGIC);
    end component;

    signal internal_count : std_logic := '0';
    signal internal_y : std_logic_vector(N-1 downto 0);
    constant max : integer := M;

begin
    countProcess: process(clock, reset, set)
    begin
        -- il segnale di reset pone a 0 il contatore
        if (reset = '1') then
            internal_y<=(others => '0');
            internal_count<= '0';
        -- il segnale di set predispone il contatore ad impostarsi su un valore in ingresso
        elsif (set='1') then
            if(conv_integer(input) > M-1) then --se il segnale di input è maggiore del conteggio massimo
                -- non posso superare il massimo valore di conteggio
                internal_y <= std_logic_vector(to_unsigned(M-1, internal_y' length));
            else
                --altrimenti pongo il segnale in ingresso al contatore
                internal_y <= input; --set assegna all'uscita il valore in input
            end if;
            internal_count <='0';
        elsif(clock 'event and clock ='1') then --se ho ricevuto un fronte di salita
            if(internal_y = std_logic_vector(to_unsigned(M-1, internal_y' length))) then
                internal_y <= (others => '0');
                internal_count <= '1';
            else
                internal_y <= internal_y + 1; --incremento l'uscita di conteggio
                internal_count <= '0';
            end if;
        end if;
    end process;
    y <= internal_y;
    count <= internal_count;

end Behavioral;
