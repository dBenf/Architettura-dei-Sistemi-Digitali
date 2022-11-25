----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 13:26:31
-- Design Name: 
-- Module Name: ALU - structural
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

entity ALU is
    Port ( comp_A : in STD_LOGIC_VECTOR (7 downto 0);
         comp_B : in STD_LOGIC_VECTOR (7 downto 0);
         start_ALU : in STD_LOGIC;
         acc_en : in STD_LOGIC;
         s_end : out STD_LOGIC;
         clock : in STD_LOGIC;
         mux_sel : out STD_LOGIC_VECTOR(1 downto 0);
         reset : in STD_LOGIC;
         partial_res : out STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture structural of ALU is

    --MOLTIPLICATORE DI BOOTH (BoothMultiplier)
    component booth_multiplier is
        generic (
            x : positive := 8;
            y : positive := 8);

        Port(clock : in std_logic;
             reset : in std_logic;
             start : in std_logic;
             m : in std_logic_vector(x - 1 downto 0);
             r : in std_logic_vector(y - 1 downto 0);
             result : out std_logic_vector(x + y - 1 downto 0);
             stop : out std_logic);
    end component;

    -- CONTATORE MODULO 3 (CounterMod3) 
    component counter_mod3 is
        Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             mux_sel : out STD_LOGIC_VECTOR (1 downto 0);
             s_end : out STD_LOGIC;
             start_stop : in STD_LOGIC);
    end component;
    
    --ADDER (Ripple Carry Adder)
    component RippleCarryAdder is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
             B : in STD_LOGIC_VECTOR (15 downto 0);
             carry : in STD_LOGIC;
             ris : out STD_LOGIC_VECTOR (15 downto 0);
             cout : out STD_LOGIC);
    end component;
    
    --REGISTRO 16 Bit (Accumulator)
    component registro is
        generic(
            N : positive := 8 );
        Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             en : in STD_LOGIC;
             D : in STD_LOGIC_VECTOR (N-1 downto 0);
             D_out : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;

    -- SEGNALI INTERNI
    signal stop_start : std_logic := '0';
    signal booth_res : std_logic_vector(15 downto 0) := (others=>'0');
    signal stop_booth : std_logic := '0';
    signal cout : std_logic := '0';
    signal out_RCA : std_logic_vector(15 downto 0) := (others=>'0');
    signal start_acc_en : std_logic := '0';
    signal ris_inout : std_logic_vector(15 downto 0) := (others=>'0');

begin

    --Processi di definizione dei segnali interni
    start_acc_en <= start_ALU and acc_en;
    stop_start <= start_ALU and stop_booth;
    partial_res <= ris_inout;

    --Definizione strutturale dei componenti interni
    BOOTH : booth_multiplier generic map(8,8)
        port map(
            clock => clock,
            reset => reset,
            start => start_ALU,
            m => comp_A,
            r => comp_B,
            result => booth_res,
            stop => stop_booth
        );

    RCA : RippleCarryAdder
        port map(
            A => booth_res,
            B => ris_inout,
            carry => '0',
            ris => out_RCA,
            cout => cout
        );

    ACCUMULATOR : registro generic map(16)
        port map(
            clock => clock,
            reset => reset,
            en => start_acc_en,
            D => out_RCA,
            D_out => ris_inout
        );

    COUNTER : counter_mod3
        port map(
            clock => clock,
            reset => reset,
            start_stop => stop_start,
            mux_sel => mux_sel,
            s_end => s_end
        );

end structural;
