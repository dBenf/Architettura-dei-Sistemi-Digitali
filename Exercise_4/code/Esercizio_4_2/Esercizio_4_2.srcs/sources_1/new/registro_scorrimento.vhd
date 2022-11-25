----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2022 12:21:06
-- Design Name: 
-- Module Name: registro_scorrimento - Behavioral
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

entity registro_scorrimento is
    Port ( selection : in std_logic_vector (1 downto 0);
         x : in std_logic;
         clock : in std_logic;
         sh : in std_logic;
         reset : in std_logic;
         load : in std_logic;
         A : in std_logic_vector (3 downto 0);
         y : out std_logic);
end registro_scorrimento;

architecture structural of registro_scorrimento is
    --Flip-Flop di tipo D
    component flip_flop_D is
        Port ( clk : in std_logic;
             reset : in std_logic;
             en : in std_logic;
             data : in std_logic;
             output : out std_logic);
    end component;
    --Multiplexer generic
    component multiplexer is
        generic(
            n : positive := 2
        );
        Port ( i : in std_logic_vector (2**n downto 1);
             sel : in std_logic_vector(n-1 downto 0);
             o : out std_logic
            );
    end component;
    --Segnali interni
    signal s_ff_out : std_logic_vector(3 downto 0); --uscite dei flip-flop
    signal s_ff_in : std_logic_vector(3 downto 0); --ingressi dei flip-flop
    signal s_mux4_out : std_logic_vector(3 downto 0); --uscita del mux 4:1
    signal s_y: std_logic; --segnale di uscita temporaneo
    signal en_or : std_logic; --segnale di abilitazione dei flip-flop (OR tra sh e load)
begin

    -- Multiplexer 4:1 per il Flip-Flop 3
    mux_4_1_3 : multiplexer generic map(2)
        port map(
            i(4) => s_ff_out(2),
            i(3) => '0',
            i(2) => s_ff_out(2),
            i(1) => s_ff_out(2),
            sel => selection,
            o => s_mux4_out(3)
        );
    -- Multiplexer 4:1 per il Flip-Flop 2
    mux_4_1_2 : multiplexer generic map(2)
        port map(
            i(4) => s_ff_out(1),
            i(3) => s_ff_out(3),
            i(2) => s_ff_out(1),
            i(1) => s_ff_out(1),
            sel => selection,
            o => s_mux4_out(2)
        );
    -- Multiplexer 4:1 per il Flip-Flop 1
    mux_4_1_1 : multiplexer generic map(2)
        port map(
            i(4) => s_ff_out(0),
            i(3) => s_ff_out(2),
            i(2) => s_ff_out(0),
            i(1) => s_ff_out(0),
            sel => selection,
            o => s_mux4_out(1)
        );
    -- Multiplexer 4:1 per il Flip-Flop 0
    mux_4_1_0 : multiplexer generic map(2)
        port map(
            i(4) => '0',
            i(3) => s_ff_out(1),
            i(2) => s_ff_out(3),
            i(1) => x,
            sel => selection,
            o => s_mux4_out(0)
        );
    -- Ciclo for per la creazione dei Mux 2:1
    mux_2_1_ciclo : for i in 0 to 3 generate
        mux_2_1_i : multiplexer generic map(1)
            port map(
                i(2) => s_mux4_out(i),
                i(1) => a(i),
                sel(0) =>load,
                o => s_ff_in(i)
            );
        end generate;
    -- Multiplexer 4:1 per l'uscita dei flip-flop
    mux_4_1_out : multiplexer generic map(2)
        port map(
            i(4) => s_ff_out(3),
            i(3) => s_ff_out(0),
            i(2) => s_ff_out(3),
            i(1) => s_ff_out(3),
            sel => selection,
            o => s_y
        );
    -- Generazione del segnale di enable dei flip-flop concorrente
    en_or <= sh or load;
    -- Ciclo per la creazione dei flip-flop del registro
    ff_interni : for i in 0 to 3 generate
        ff_i : flip_flop_D
            port map(
                data => s_ff_in(i),
                clk => clock,
                reset => reset,
                en => en_or,
                output => s_ff_out(i)
            );
        end generate;
    -- Flip-Flop per la sincronizzazione dell'uscita
    ff_out : flip_flop_D
        port map(
            data => s_y,
            clk => clock,
            reset => reset,
            en => sh,
            output => y
        );
end structural;
