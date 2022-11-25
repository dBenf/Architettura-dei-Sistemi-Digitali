----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 19:02:59
-- Design Name: 
-- Module Name: orologio - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity orologio is
    Port (
        clock : in STD_LOGIC;
        set_s : in STD_LOGIC;
        set_m : in STD_LOGIC;
        set_h : in STD_LOGIC;
        input_s : in STD_LOGIC_VECTOR(5 downto 0);
        input_m : in STD_LOGIC_VECTOR(5 downto 0);
        input_h : in STD_LOGIC_VECTOR(5 downto 0);
        reset : in STD_LOGIC;
        --        y_time : out STD_LOGIC_VECTOR(16 downto 0);

        -- IMPLEMENTAZIONE SU SCHEDA
        --        input_s: inout unsigned(5 downto 0) := (others => '0'); --uscita secondi
        --        input_m: inout unsigned(5 downto 0) := (others => '0'); --uscita minuti
        --        input_h: inout unsigned(4 downto 0) := (others => '0'); --uscita ore
        an : out std_logic_vector(7 downto 0);
        cat : out std_logic_vector(7 downto 0);
        VALUE: in STD_LOGIC_VECTOR(5 downto 0) := "000000"    --input
        -- ---------------------------
    );
end orologio;

architecture structural of orologio is

    -- IMPLEMENTAZIONE SU SCHEDA
    signal reset_in : STD_LOGIC;
    signal start_in : STD_LOGIC;
    signal s_load : STD_LOGIC := '0';
    signal VALUEs: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');    --secondi
    signal VALUEm: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');    --minuti
    signal VALUEh: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');    --ore
    --signal VALUE : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    -- --------------------------

    signal clock_out : std_logic :='0';
    signal count_s, count_m, count_h : std_logic :='0';
    signal secondi : std_logic_vector(5 downto 0):= (others =>'0');
    signal minuti : std_logic_vector(5 downto 0):= (others =>'0');
    signal ore : std_logic_vector(5 downto 0):= (others =>'0');

    component div_frequenza is
        generic(
            clock_frequency_in : integer := 50000000;
            clock_frequency_out : integer := 1
        );
        Port (
            clock_in : in STD_LOGIC;
            reset: in STD_LOGIC;
            clock_out : out STD_LOGIC
        );
    end component;

    component cont_mod_M is
        generic (
            M: integer;
            N: integer
        );
        Port (
            clock: in std_logic;
            set: in std_logic;
            input: in std_logic_vector(N-1 downto 0);
            reset: in std_logic;
            count: out std_logic;
            y: out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- IMPLEMENTAZIONE SU SCHEDA
    component loading_time is
        generic(
            N : integer := 5
        );
        Port (
            x : in STD_LOGIC_VECTOR(N-1 downto 0);
            set : in STD_LOGIC;
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            out_time: out STD_LOGIC_VECTOR(N-1 downto 0)
        );
    end component;

    component orologio_board is
        Port (
            clock : in std_logic;
            reset : in std_logic;
            sec : in std_logic_vector(5 downto 0);
            min : in std_logic_vector(5 downto 0);
            hour : in std_logic_vector(5 downto 0);
            anodi : out std_logic_vector(7 downto 0);
            catodi : out std_logic_vector(7 downto 0)
        );
    end component;
    -- ---------------------------------------------

begin
    divisore_di_frequenza: div_frequenza
        generic map(
            clock_frequency_in => 50000000,
            clock_frequency_out => 1
        )
        Port map(
            clock_in => clock,
            reset => reset,
            clock_out => clock_out
        );
    contatore_secondi : cont_mod_M
        generic map (
            M => 60,
            N => 6
        )
        Port map (
            clock => clock_out,
            set => set_s,
            input => VALUEs,
            reset => reset,
            count => count_s,
            y=> secondi
        );
    contatore_minuti : cont_mod_M
        generic map (
            M => 60,
            N => 6
        )
        Port map (
            clock => count_s,
            set => set_m,
            input => VALUEm,
            reset => reset,
            count => count_m,
            y=> minuti
        );
    contatore_ore : cont_mod_M
        generic map (
            M => 24,
            N => 6
        )
        Port map (
            clock => count_m,
            set => set_h,
            input => VALUEh,
            reset => reset,
            count => count_h,
            y=> ore
        );

    --y_time <= ore & minuti & secondi;

    -- IMPLEMENTAZIONE SU SCHEDA
    reset_in <= not reset;      --Azzera il conteggio

    load_sec : loading_time
        generic map(
            N => 6
        )
        port map(
            x => input_s,
            set => set_s,
            clk => clock,
            reset => reset_in,
            out_time => VALUEs
        );

    load_min : loading_time
        generic map(
            N => 6
        )
        port map(
            x => input_m,
            set => set_m,
            clk => clock,
            reset => reset_in,
            out_time => VALUEm
        );

    load_hour : loading_time
        generic map(
            N => 6
        )
        port map(
            x => input_h,
            set => set_h,
            clk => clock,
            reset => reset_in,
            out_time => VALUEh
        );

    display: orologio_board
        port map(
            clock => clock,
            reset => reset_in,
            sec => secondi,
            min => minuti,
            hour => ore,
            anodi => an,
            catodi => cat
        );
    -- PORCHERIA PER IMPLEMETAZIONE SU SCHEDA
    segnale_value : process(VALUE, clock)
    begin
        if (set_h = '1' and set_m = '0' and set_s = '0') then
            VALUEh <= VALUE;
        elsif (set_h = '0' and set_m = '1' and set_s = '0') then
            VALUEm <= VALUE;
        elsif (set_h = '0' and set_m = '0' and set_s = '1') then
            VALUEs <= VALUE;
        end if;
    end process;
    -- -------------------------

end structural;
