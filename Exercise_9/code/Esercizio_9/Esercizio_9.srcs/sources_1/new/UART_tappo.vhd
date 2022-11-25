----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 12:57:51
-- Design Name: 
-- Module Name: UART_tappo - Behavioral
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

entity UART_tappo is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        dato_in: in std_logic_vector(7 downto 0);
        DBOUT: out std_logic_vector(7 downto 0)
    );
end UART_tappo;

architecture structural of UART_tappo is

    component UARTcomponent is
        Generic (
            BAUD_DIVIDE_G : integer := 14; 	--115200 baud
            BAUD_RATE_G   : integer := 231
        );
        Port (
            TXD 	: out 	std_logic  	:= '1';					-- Transmitted serial data output
            RXD 	: in  	std_logic;							-- Received serial data input
            CLK 	: in  	std_logic;							-- Clock signal
            DBIN 	: in  	std_logic_vector (7 downto 0);		-- Input parallel data to be transmitted
            DBOUT 	: out 	std_logic_vector (7 downto 0);		-- Recevived parallel data output
            RDA		: inout  std_logic;							-- Read Data Available
            TBE		: out 	std_logic 	:= '1';					-- Transfer Buffer Emty
            RD		: in  	std_logic;							-- Read Strobe
            WR		: in  	std_logic;							-- Write Strobe
            PE		: out 	std_logic;							-- Parity error		
            FE		: out 	std_logic;							-- Frame error
            OE		: out 	std_logic;							-- Overwrite error
            RST		: in  	std_logic	:= '0');				-- Reset signal
    end component;

    -- SEGNALI INTERNI
    signal internal: std_logic;

begin

    UART: UARTcomponent
        port map(
            TXD=>internal,
            RXD=>internal,
            CLK=>clock,
            DBIN=>dato_in,
            DBOUT=>DBOUT,
            RDA=>OPEN,
            TBE=>OPEN,
            RD=>'0',
            WR=>start,
            RST=>reset
        );

end structural;
