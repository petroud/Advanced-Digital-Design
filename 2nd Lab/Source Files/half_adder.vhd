----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Half-Adder
-- Project Name: Laboratory 1
-- Description: 
--This is an implementation of a half-adder with inputs x and y and outputs
--s(result) and c(carry)
----------------------------------------------------------------------------------

library ieee; --Libraries Declaration
use ieee.std_logic_1164.all;

entity half_adder is
port ( 
    --Inputs
    x: in std_logic; --Signal in and out declarations
    y: in std_logic;
    --Outputs
    s: out std_logic;
    c: out std_logic);
end half_adder;

architecture dataflow of half_adder is --Architecture implementation

begin
    s <= x xor y; --implementation of Half Adder
    c <= x and y;
end dataflow;