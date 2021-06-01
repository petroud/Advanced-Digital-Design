----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Full-Adder
-- Project Name: Laboratory 1
-- Description: 
--This is an implementation of a full-adder using two half-adders as components.
----------------------------------------------------------------------------------

library ieee; --Libraries Declaration
use ieee.std_logic_1164.all;

entity full_adder is
port ( 
    --Inputs
    x: in std_logic; --Signal in and out declarations
    y: in std_logic;
    z: in std_logic;
    --Outputs
    s: out std_logic;
    c: out std_logic);
end full_adder;

architecture struct_dataflow of full_adder is --Architecture implementation
component half_adder --component declarations
port ( 
    x: in std_logic;
    y: in std_logic;
    s: out std_logic;
    c: out std_logic);
end component;

signal hs, hc, tc: std_logic; --internal signals decarations

begin
HA1: half_adder --port mapping (signals connection) of 1st HA
port map (
    x => x,
    y => y,
    s => hs,
    c => hc);

HA2: half_adder --port mapping (signals connection) of 2nd HA
port map (
    x => hs,
    y => z,
    s => s,
    c => tc);
    c <= tc or hc; --carry implementation
end struct_dataflow;