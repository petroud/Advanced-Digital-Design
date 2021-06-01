----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Equations
-- Module Name: equations - Behavioral
-- Project Name: Laboratory 1
-- Description: 
---- This curcuit has 7 input signals:
--A = which can be either '0' or '1'
--B = which can be either '0' or '1'
--C(0-5) = which are 6 signals that calculate 6 different functions using A and B
--if they are set to '1' and they give result '0' when they are set to '0'
----It also has 6 output signals:
--RESULT(0-5) = gives the result for every one of the 6 functions
----The functions are the following:
--0) A NAND B
--1) A NOR B
--2) A AND B
--3) A XOR B
--4)(A AND B) OR (A' AND B')
--5)(A' AND B) XOR (A' OR B)
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Setting all the inputs and outputs
entity equations is
    Port(
    --Inputs
    A: in std_logic;
    B: in std_logic;
    C0: in std_logic;
    C1: in std_logic;
    C2: in std_logic;
    C3: in std_logic;
    C4: in std_logic;
    C5: in std_logic;
    --Outputs
    RESULT: out std_logic_vector(5 downto 0));
end equations;

--Setting all the functions to the outputs
architecture Behavioral of equations is

begin
    RESULT(0)<=(A NAND B)AND(C0);
    RESULT(1)<=(A NOR B)AND(C1);
    RESULT(2)<=(A AND B)AND(C2);
    RESULT(3)<=(A XOR B)AND(C3);
    RESULT(4)<=(A XNOR B)AND(C4);
    RESULT(5)<=((NOT(A) AND B)XOR(NOT(A) OR B))AND(C5);

end Behavioral;
