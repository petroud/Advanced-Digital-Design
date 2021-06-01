----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Double-Bit-Adder
-- Project Name: Laboratory 1
-- Description: 
--This is the implementation of a 2-bit-input adder using two full-adders as its 
--components. 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity double_bit_adder is
    Port( A: IN std_logic_vector(1 downto 0);
    B: IN std_logic_vector(1 downto 0); 
    RESULT: OUT std_logic_vector(1 downto 0);
    cin: IN std_logic;
    c1: OUT std_logic
    );
end double_bit_adder;

architecture Behavioral of double_bit_adder is

-- Component Declaration for the Unit Under Test (UUT)
component full_adder       --component declarations
port( 
     --Inputs   
     x : IN std_logic;
     y : IN std_logic;
     z : IN std_logic;
     --Outputs
     s : OUT std_logic;
     c : OUT std_logic
     );
end component;

signal c0: std_logic; --internal signals decarations

begin

FA0: full_adder
port map(         --port mapping (signals conection) of 1st FA
    x => A(0),
    y => B(0),
    z => cin,
    s => RESULT(0),
    c => c0);
    
FA1: full_adder
port map(         --port mapping (signals conection) of 2nd FA
    x => A(1),
    y => B(1),
    z => c0,
    s => RESULT(1),
    c => c1);
end Behavioral;
