----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 20:19:06
-- Design Name: 
-- Module Name: unita_op - structural
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

entity unita_op is
    Port ( binA : in STD_LOGIC_VECTOR (7 downto 0);
         binB : in STD_LOGIC_VECTOR (7 downto 0);
         selA : in STD_LOGIC :='0';
         selB : in STD_LOGIC :='0';
         enA : in STD_LOGIC :='0';
         enB : in STD_LOGIC :='0';
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         Bout : out STD_LOGIC_VECTOR (7 downto 0);
         cout_op : out STD_LOGIC);
end unita_op;

architecture structural of unita_op is
    -- Componenti 
    component mux_2_1 is
        port (
            x1 : in STD_LOGIC_VECTOR (7 downto 0);
            x0 : in STD_LOGIC_VECTOR (7 downto 0);
            load : in STD_LOGIC;
            y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component registro is
        port (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            en : in STD_LOGIC;
            o : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    component Sottrattore is
        port (
            A: in std_logic_vector(7 downto 0);
            B: in std_logic_vector(7 downto 0);
            carry: in std_logic:='1';
            ris: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;

    -- Segnali interni
    signal out_muxA : std_logic_vector (7 downto 0) := (others=>'0');
    signal out_muxB : std_logic_vector (7 downto 0) := (others=>'0');
    signal out_regA : std_logic_vector (7 downto 0) := (others=>'0');
    signal out_regB : std_logic_vector (7 downto 0) := (others=>'0');
    signal out_add : std_logic_vector (7 downto 0) := (others=>'0');
    signal carry_s : std_logic := '1';

begin
    -- multiplexer di ingresso ai registri
    mux2_1_A : mux_2_1
        port map (
            x1 => BinA,
            x0 => out_add,
            load => selA,
            y => out_muxA
        );
    mux2_1_B : mux_2_1
        port map (
            x1 => BinB,
            x0 => (others=>'0'),
            load => selB,
            y => out_muxB
        );
    -- registri A e B
    registro_A : registro
        port map (
            D => out_muxA,
            clock => clock,
            reset => reset,
            en => enA,
            o => out_regA
        );
    registro_B : registro
        port map (
            D => out_muxB,
            clock => clock,
            reset => reset,
            en => enB,
            o => out_regB
        );
    -- Sottrattore
    sottrazione : Sottrattore
        port map (
            A => out_regA,
            B => out_regB,
            carry => carry_s,
            ris => out_add,
            cout => cout_op
        );
    -- uscita concorrente
    Bout<=out_add;

end structural;
