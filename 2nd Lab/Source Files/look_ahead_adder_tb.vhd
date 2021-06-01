----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2020 15:49:30
-- Design Name: 
-- Module Name: look_ahead_adder_tb - Behavioral
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

entity look_ahead_adder_tb is
end look_ahead_adder_tb;

architecture Behavioral of look_ahead_adder_tb is

COMPONENT look_ahead_adder
    PORT (
        A: in std_logic_vector (3 downto 0);
        B: in std_logic_vector (3 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector (3 downto 0);
        C3: out std_logic
    );
END COMPONENT;

signal A,B,S : std_logic_vector (3 downto 0);
signal Cin,C3 : std_logic;



begin

laad: look_ahead_adder
    PORT MAP(   
        A=>A,
        B=>B,
        Cin=>Cin,
        S=>S,
        C3=>C3
    );

sim_proc: process
    begin
        A<="1111";
        B<="0000";
        Cin<='1';
        wait for 100ns;
        
        A<="1111";
        B<="1111";
        Cin<='1';
        wait for 100ns;
        
        A<="1011";
        B<="0100";
        Cin<='1';
        wait for 100ns;
        
        A<="0010";
        B<="1011";
        Cin<='1';
        wait for 100ns;
        
        A<="1101";
        B<="0101";
        Cin<='1';
        wait for 100ns;
        
        A<="1011";
        B<="0110";
        Cin<='0';
        wait for 100ns;
        
        A<="1111";
        B<="0000";
        Cin<='0';
        wait for 100ns;
        
        wait;
end process;
        
        

end Behavioral;
