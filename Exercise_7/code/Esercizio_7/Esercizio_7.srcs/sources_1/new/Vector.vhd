----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 11:43:19
-- Design Name: 
-- Module Name: Vector - Behavioral
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

entity Vector is
    Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
         read_en : in STD_LOGIC_VECTOR (1 downto 0);
         mux_sel : in STD_LOGIC_VECTOR (1 downto 0);
         data_out : out STD_LOGIC_VECTOR (7 downto 0);
         clock : in STD_LOGIC;
         reset : in STD_LOGIC);
end Vector;

architecture hybrid of Vector is
    --Componenti utili
    -- REGISTRO
    component registro is
        generic(
            N : positive := 8 );
        Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             en : in STD_LOGIC;
             D : in STD_LOGIC_VECTOR (N-1 downto 0);
             D_out : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;
    --Segnali interni
    type words is array(2 downto 0) of std_logic_vector(7 downto 0);
    signal data_out_reg : words;
    
    signal data_out_1 : std_logic_vector(7 downto 0);
    signal data_out_2 : std_logic_vector(7 downto 0);
    signal data_out_3 : std_logic_vector(7 downto 0);
    signal reg_en : std_logic_vector(2 downto 0);

begin
    --Istanziazione Registri (M=8, N=3, numero di registri=3 da 8)
    Reg : for i in 0 to 2 generate
        reg_i : registro generic map(8)
            port map(
                clock => clock,
                reset => reset,
                en => reg_en(i),
                D => data_in,
                D_out => data_out_reg(i)
            );
    end generate;

    -- Process per il funzionamento del DECODER
    process(read_en)
    begin
        case read_en is
            when "00" => reg_en<="000";
            when "01" => reg_en<="001"; -- terzo registro 
            when "10" => reg_en<="010"; -- secondo registro
            when "11" => reg_en<="100"; -- primo registro
            when others => reg_en<= "000";
        end case;
    end process;

    -- Process per il funzionamento del MULTIPLEXER
    process(data_out_reg,mux_sel)
    begin
        case mux_sel is
            when "00" => data_out<=(others=>'0');
            when "01" => data_out<=data_out_reg(0); -- terzo registro
            when "10" => data_out<=data_out_reg(1); -- secondo registro
            when "11" => data_out<=data_out_reg(2); -- primo registro
            when others => data_out<=(others=>'0');
        end case;
    end process;
end hybrid;
