----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2020 15:23:03
-- Design Name: 
-- Module Name: look_ahead_adder - Behavioral
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

entity look_ahead_adder is
port (
    A: in std_logic_vector (3 downto 0);
    B: in std_logic_vector (3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector (3 downto 0);
    C3: out std_logic
 );
end look_ahead_adder;

architecture Behavioral of look_ahead_adder is
component carry_gen_pro
port (
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    P: out std_logic_vector(3 downto 0);
    G: out std_logic_vector(3 downto 0)
 );
end component;

component carry_look_ahead
port ( 
    P: in std_logic_vector (3 downto 0);
    G: in std_logic_vector (3 downto 0);    
    Cin: in std_logic;
    C: out std_logic_vector (3 downto 0)
    );
end component;

component sum
port ( 
    P: in std_logic_vector (3 downto 0);
    C: in std_logic_vector (2 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector (3 downto 0) 
    );
end component;

signal ip, ig: std_logic_vector (3 downto 0);
signal ic: std_logic_vector (2 downto 0);

begin

CGP: carry_gen_pro
port map(
    A => A,
    B => B,
    P => ip,
    G => ig);
    
CLA: carry_look_ahead
port map(
    P => ip,
    G => ig,
    C(3) => C3,
    C(0) => ic(0),
    C(1) => ic(1),
    C(2) => ic(2),
    Cin => Cin);
    
SU: sum
port map(
    Cin => Cin,
    P => ip,
    C => ic,
    S => S);
    
end Behavioral;
    
