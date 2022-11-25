----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 13:24:42
-- Design Name: 
-- Module Name: 2_UART - Behavioral
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

entity UART2 is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        dato_in: in std_logic_vector(7 downto 0);
        DBOUT: out std_logic_vector(7 downto 0)
    );
end UART2;

architecture structural of UART2 is

    component UARTcomponent is
        Generic (
            BAUD_DIVIDE_G : integer := 14;--115200 baud
            BAUD_RATE_G : integer := 231
        );
        Port (
            TXD : out std_logic := '1';
            RXD : in std_logic;
            CLK : in std_logic;
            DBIN : in std_logic_vector (7 downto 0);
            DBOUT : out std_logic_vector (7 downto 0);
            RDA : inout std_logic;
            TBE : out std_logic := '1';
            RD : in std_logic;
            WR : in std_logic;
            PE : out std_logic;
            FE : out std_logic;
            OE : out std_logic;
            RST : in std_logic:= '0');
    end component;

    -- SEGNALI INTERNI
    signal internal: std_logic;
    signal uscita_temp: std_logic_vector(7 downto 0);
    signal temp1,temp2,temp3 : std_logic := '0';

begin

    UART_TX: UARTcomponent
        port map(
            TXD=>internal,
            RXD=>'0',
            CLK=>clock,
            DBIN=>dato_in,
            DBOUT=>uscita_temp,
            RDA=>temp1,
            RD=>'0',
            WR=>start,
            RST=>reset
        );

    UART_RX: UARTcomponent
        port map(
            TXD=>temp3,
            RXD=>internal,
            CLK=>clock,
            DBIN=>(others=>'0'),
            DBOUT=>DBOUT,
            RDA=>temp2,
            RD=>'0',
            WR=>'0',
            RST=>reset
        );

end structural;
