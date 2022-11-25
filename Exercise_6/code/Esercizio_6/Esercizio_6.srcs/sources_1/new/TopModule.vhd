----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 17:50:18
-- Design Name: 
-- Module Name: TopModule - Behavioral
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

entity TopModule is
    Port (
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        input1 : in STD_LOGIC_VECTOR(15 downto 0);
        input2 : in STD_LOGIC_VECTOR(15 downto 0);
        output1 : out STD_LOGIC_VECTOR(15 downto 0);
        output2 : out STD_LOGIC_VECTOR(15 downto 0));
end TopModule;

architecture structural of TopModule is
    -- Componenti
    component SystemA is
        port(
            clock : in STD_LOGIC;
            start : in STD_LOGIC;
            reset : in STD_LOGIC;
            A_received : in STD_LOGIC;
            A_ready : out STD_LOGIC;
            w1 : in STD_LOGIC_VECTOR (15 downto 0);
            w2 : in STD_LOGIC_VECTOR (15 downto 0);
            o : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    component SystemB is
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            start : in STD_LOGIC;
            input : in STD_LOGIC_VECTOR(7 downto 0);
            B_ready : in STD_LOGIC;
            B_received : out STD_LOGIC;
            w1 : out STD_LOGIC_VECTOR(15 downto 0);
            w2 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    component ControlUnit is
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            start : in STD_LOGIC;
            inputA : in STD_LOGIC_VECTOR(3 downto 0);
            outputB : out STD_LOGIC_VECTOR(7 downto 0);
            A_ready : in STD_LOGIC;
            A_received : out STD_LOGIC;
            B_ready : out STD_LOGIC;
            B_received : in STD_LOGIC
        );
    end component;
    -- Segnali interni
    signal A_ready,A_received : std_logic := '0';
    signal B_ready,B_received: std_logic := '0';
    signal outputA : std_logic_vector(3 downto 0):= (others=>'0');
    signal inputB : std_logic_vector(7 downto 0):= (others=>'0');

begin

    UC_sysA : SystemA
        port map (
            clock => clock,
            start => start,
            reset => reset,
            A_received => A_received,
            A_ready => A_ready,
            w1 => input1,
            w2 => input2,
            o => outputA
        );
    UC_sysB : SystemB
        port map (
            clock => clock,
            reset => reset,
            start => start,
            input => inputB,
            B_ready => B_ready,
            B_received => B_received,
            w1 => output1,
            w2 => output2
        );
    UC_ctrl_unit : ControlUnit
        port map (
            clock => clock,
            reset => reset,
            start => start,
            inputA => outputA,
            outputB => inputB,
            A_ready => A_ready,
            A_received => A_received,
            B_ready => B_ready,
            B_received => B_received
        );

end structural;
