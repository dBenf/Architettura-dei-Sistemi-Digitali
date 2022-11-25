----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2022 20:10:51
-- Design Name: 
-- Module Name: unita_ctrl_microprog - Behavioral
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

entity microRom is
    port(
        PC: in unsigned(2 downto 0);
        PC_next: out unsigned (2 downto 0);
        JCount: out std_logic;
        enA: out std_logic;
        selA: out std_logic;
        enB: out std_logic;
        selB: out std_logic;
        ricA: out std_logic;
        ricB: out std_logic
    );
end microRom;
architecture synth of microRom is
    type controllo_type is record
        PC_next: unsigned (2 downto 0);
        JCount: std_logic;
        enA: std_logic;
        selA: std_logic;
        enB: std_logic;
        selB: std_logic;
        ricA: std_logic;
        ricB: std_logic;
    end record;

    constant idle : controllo_type :=(
        PC_next=>"000",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'0',
        selB=>'0',
        ricA=>'0',
        ricB=>'0'
    );

    constant richiestaA: controllo_type:=(
        PC_next=>"010",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'0',
        selB=>'0',
        ricA=>'1',
        ricB=>'0'
    );

    constant waitA: controllo_type:=(
        PC_next=>"010",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'0',
        selB=>'0',
        ricA=>'0',
        ricB=>'0'
    );
    constant inA: controllo_type:=(
        PC_next=>"100",
        JCount=>'0',
        enA=>'1',
        selA=>'1',
        enB=>'0',
        selB=>'0',
        ricA=>'0',
        ricB=>'0'
    );

    constant richiestaB: controllo_type:=(
        PC_next=>"101",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'0',
        selB=>'0',
        ricA=>'0',
        ricB=>'1'
    );
    constant waitB: controllo_type:=(
        PC_next=>"101",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'0',
        selB=>'0',
        ricA=>'0',
        ricB=>'0'
    );
    constant inB: controllo_type:=(
        PC_next=>"111",
        JCount=>'0',
        enA=>'0',
        selA=>'0',
        enB=>'1',
        selB=>'1',
        ricA=>'0',
        ricB=>'0'
    );

    constant op : controllo_type:=(
        PC_next=>"111",
        JCount=>'1',
        enA=>'1',
        selA=>'0',
        enB=>'1',
        selB=>'0',
        ricA=>'0',
        ricB=>'0'
    );
    type ROM_TYPE is array (0 to 7) of controllo_type;
    constant ROM: ROM_type:=(
        0=>idle,
        1=>richiestaA,
        2=>waitA,
        3=>inA,
        4=>richiestaB,
        5=>waitB,
        6=>inB,
        7=>op
    );
    signal controllo : controllo_type;
begin
    controllo <= ROM(to_integer(PC));
    PC_next<= controllo.PC_next;
    JCount<=controllo.JCount;
    enA<= controllo.enA;
    selA<= controllo.selA;
    enB<= controllo.enB;
    selB<= controllo.selB;
    ricA<= controllo.ricA;
    ricB<= controllo.ricB;
end synth;