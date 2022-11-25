----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2022 12:51:47
-- Design Name: 
-- Module Name: topModule - structural
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

entity topModule is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         start_in : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         result : out STD_LOGIC_VECTOR (15 downto 0));
end topModule;

architecture structural of topModule is

    -- COMPONENTI
    component UnitaOperativa is
        Port(
            A : in std_logic_vector(7 downto 0); --
            B : in std_logic_vector(7 downto 0); --
            clock : in std_logic; --
            reset : in std_logic; --
            read_en : in std_logic_vector(1 downto 0);
            start : in std_logic;
            acc_en : in std_logic;
            result_en : in std_logic;
            s_end : out std_logic;
            result : out std_logic_vector(15 downto 0) --
        );
    end component;

    component UnitaControllo is
        Port ( clock : in STD_LOGIC; --
             reset : in STD_LOGIC; --
             start_in : in STD_LOGIC; --
             start : out STD_LOGIC;
             s_end : in STD_LOGIC;
             acc_en : out STD_LOGIC;
             result_en : out STD_LOGIC;
             read_en : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

    -- SEGNALI INTERNI
    signal read_en_int : std_logic_vector(1 downto 0);
    signal start_int : std_logic;
    signal acc_en_int : std_logic;
    signal result_en_int : std_logic;
    signal s_end_int : std_logic;

begin

    UO : UnitaOperativa
        port map(
            A => A,
            B => B,
            clock => clock,
            reset => reset,
            read_en => read_en_int,
            start => start_int,
            acc_en => acc_en_int,
            result_en => result_en_int,
            s_end => s_end_int,
            result => result
        );
    UC : UnitaControllo
        port map(
            clock => clock,
            reset => reset,
            start_in => start_in,
            start => start_int,
            s_end => s_end_int,
            acc_en => acc_en_int,
            result_en => result_en_int,
            read_en => read_en_int
        );

end structural;
