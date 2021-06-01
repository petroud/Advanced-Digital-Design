----------------------------------------------------------------------------------
-- Dimitrios Petrou , Georgios Frangias
-- Advanced Digital Design ACE203
-- LAB 2
-- Code for module 'carry_gen_pro'
-- 8/3/2020
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Declaration of the unit's ports
entity carry_gen_pro is
port (
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    P: out std_logic_vector(3 downto 0);
    G: out std_logic_vector(3 downto 0)
 );
end carry_gen_pro;


--Implementation of the architecture
architecture Behavioral of carry_gen_pro is

--Declaring components to be used later
component half_adder
port(
    x: in std_logic;
    y: in std_logic;
    s: out std_logic;
    c: out std_logic
    );
end component;



begin
--Creating instances of the HA component & Routing of the instances ports to local signals and ports


HA3: half_adder
port map(     --4th bits of the numbers
    x=>A(3),
    y=>B(3),
    s=>P(3),
    c=>G(3));
    
HA2: half_adder
port map(     --3rd bits of the numbers
    x=>A(2),
    y=>B(2),
    s=>P(2),
    c=>G(2));
    
HA1: half_adder
port map(     --2nd bits of the numbers
    x=>A(1),
    y=>B(1),
    s=>P(1),
    c=>G(1));
    
HA0: half_adder
port map(     --1st bits of the numbers
    x=>A(0),
    y=>B(0),
    s=>P(0),
    c=>G(0));
   
end Behavioral;
