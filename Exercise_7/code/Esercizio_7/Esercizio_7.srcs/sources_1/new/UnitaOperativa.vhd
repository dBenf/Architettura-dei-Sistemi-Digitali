----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 18:00:41
-- Design Name: 
-- Module Name: UnitaOperativa - Behavioral
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

entity UnitaOperativa is
    Port(
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        clock : in std_logic;
        reset : in std_logic;
        read_en : in std_logic_vector(1 downto 0);
        start : in std_logic;
        acc_en : in std_logic;
        result_en : in std_logic;
        s_end : out std_logic;
        result : out std_logic_vector(15 downto 0)
    );
end UnitaOperativa;

architecture structural of UnitaOperativa is
    -- COMPONENTI UTILI: Vettore
    component Vector is
        Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
             read_en : in STD_LOGIC_VECTOR (1 downto 0);
             mux_sel : in STD_LOGIC_VECTOR (1 downto 0);
             data_out : out STD_LOGIC_VECTOR (7 downto 0);
             clock : in STD_LOGIC;
             reset : in STD_LOGIC);
    end component;
    -- COMPONENTI UTILI: Unità Aritmetica
    component ALU is
        Port ( comp_A : in STD_LOGIC_VECTOR (7 downto 0);
             comp_B : in STD_LOGIC_VECTOR (7 downto 0);
             start_ALU : in STD_LOGIC;
             acc_en : in STD_LOGIC;
             s_end : out STD_LOGIC;
             clock : in STD_LOGIC;
             mux_sel : out STD_LOGIC_VECTOR(1 downto 0);
             reset : in STD_LOGIC;
             partial_res : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    -- COMPONENTI UTILI: Registro 16 bit
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
    signal mux_sel : std_logic_vector(1 downto 0) := (others=>'0');
    signal compA : std_logic_vector(7 downto 0) := (others=>'0');
    signal compB : std_logic_vector(7 downto 0) := (others=>'0');
    signal partial_res : std_logic_vector(15 downto 0) := (others=>'0');
begin
    VettoreA : Vector
        port map(
            data_in => A,
            read_en => read_en,
            mux_sel => mux_sel,
            clock => clock,
            reset => reset,
            data_out => compA
        );
    VettoreB : Vector
        port map(
            data_in => B,
            read_en => read_en,
            mux_sel => mux_sel,
            clock => clock,
            reset => reset,
            data_out => compB
        );
    UnitaAritmetica : ALU
        port map(
            comp_A => compA,
            comp_B => compB,
            start_ALU => start,
            acc_en => acc_en,
            s_end => s_end,
            clock => clock,
            mux_sel => mux_sel,
            reset => reset,
            partial_res => partial_res
        );
    ResultRegister : registro generic map(16)
        port map(
            clock => clock,
            reset => reset,
            en => result_en,
            D => partial_res,
            D_out => result
        );
end structural;
