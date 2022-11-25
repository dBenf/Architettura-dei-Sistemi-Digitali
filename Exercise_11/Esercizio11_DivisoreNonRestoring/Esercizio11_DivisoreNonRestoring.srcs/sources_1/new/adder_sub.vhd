----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 22:30:22
-- Design Name: 
-- Module Name: adder_sub - structural
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

entity adder_sub is
    generic ( N:integer := 4);
    Port (
        X, Y: in std_logic_vector(N-1 downto 0);
        cin: in std_logic;
        Z: out std_logic_vector(N-1 downto 0);
        cout: out std_logic
    );
end adder_sub;

architecture structural of adder_sub is

    component ripple_carry is
        Port (
            X, Y: in std_logic_vector(N-1 downto 0);
            c_in: in std_logic;
            c_out: out std_logic;
            Z: out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal complementoy: std_logic_vector(N-1 downto 0);

begin
    complemento_y: for i in 0 to N-1 generate
        complementoy(i) <= Y(i) xor cin;
    end generate;
    
    RA: ripple_carry
        port map (
            X,
            complementoy,
            cin,
            cout,
            Z
        );

end structural;
