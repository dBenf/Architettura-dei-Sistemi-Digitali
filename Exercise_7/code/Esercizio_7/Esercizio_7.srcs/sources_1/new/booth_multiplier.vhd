----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2022 17:14:26
-- Design Name: 
-- Module Name: booth_multiplier - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_multiplier is
    -- Il componente esegue il prodotto m * r
    generic (
        x : positive := 8; --numero di bit di m
        y : positive := 8); --numero di bit di r

    Port(clock : in std_logic;
         reset : in std_logic;
         start : in std_logic;
         m : in std_logic_vector(x - 1 downto 0);
         r : in std_logic_vector(y - 1 downto 0);
         result : out std_logic_vector(x + y - 1 downto 0);
         stop : out std_logic);

end booth_multiplier;

architecture Behavioral of booth_multiplier is

begin
    process(clock, reset)
        constant X_ZEROS : std_logic_vector(x - 1 downto 0) := (others => '0');
        constant Y_ZEROS : std_logic_vector(y - 1 downto 0) := (others => '0');

        -- le variabili a, s e p servono per l'esecuzione dell'algoritmo di Booth
        variable a, s, p : std_logic_vector(x + y + 1 downto 0);
        variable mn      : std_logic_vector(x - 1 downto 0);

    begin
        if (reset = '1') then
            result <= (others=>'0');
            stop <= '0';
        end if;
        if(clock'event and clock = '1') then
            if (start = '1') then
                --Inizializzazione di a, s e p
                a := (others => '0');
                s := (others => '0');
                p := (others => '0');

                -- Se m o r sono zero, il risultato è nullo in ogni caso
                if (m /= X_ZEROS and r /= Y_ZEROS) then

                    --Settaggio di a nel formato m|0...0|0
                    a(x + y downto y + 1) := m;
                    a(x + y + 1) := m(x - 1);

                    --Settaggio di s nel formato -m|0...0|0
                    mn := (not m) + 1;
                    s(x + y downto y + 1) := mn;
                    s(x + y + 1) := not(m(x - 1));

                    --Setteggia di p nel formato 0...0|r|0
                    p(y downto 1) := r;

                    --Check degli ultimi due bit di p 
                    for i in 1 to y loop
                        -- è necessario ridefinire p solo se non sono '00' o '11'
                        if (p(1 downto 0) = "01") then
                            p := p + a;
                        elsif (p(1 downto 0) = "10") then
                            p := p + s;
                        end if;

                        -- Shift aritmetico a destra
                        -- (fatto in ogni caso)
                        p(x + y downto 0) := p(x + y + 1 downto 1);
                    end loop;
                end if;
                --Scrittura del risultato (si esclude l'ultimo bit di p)
                result <= p(x + y downto 1);
                --Segnalazione della terminazione dell'operazione
                stop <= '1';
            end if;
        end if;
    end process;

end Behavioral;
