----------------------------------------------------------------------------------
-- Dimitrios Petrou , Georgios Frangias
-- Advanced Digital Design ACE203
-- LAB 2
-- Code for module 'carry_look_ahead'
-- 7/3/2020
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Declaration of the ports of the entity 
entity carry_look_ahead is
port ( 
    P: in std_logic_vector (3 downto 0);
    G: in std_logic_vector (3 downto 0);    
    Cin: in std_logic;
    C: out std_logic_vector (3 downto 0)
    );
end carry_look_ahead;


--Implementation of the architecture of the entity
architecture Behavioral of carry_look_ahead is

begin
    --Calculating bit by bit the digits of the Carry out according to the equations provided.
    C(0) <= G(0) or (P(0) and Cin);  
    C(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
    C(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
    C(3) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);
    
end Behavioral;
