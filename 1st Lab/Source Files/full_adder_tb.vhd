----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Full-Adder Testbench
-- Project Name: Laboratory 1
-- Description: 
--This is a testbench that uses the file equations.vhd as a component. 
--
----------------------------------------------------------------------------------

LIBRARY ieee; --Libraries Declaration
USE ieee.std_logic_1164.ALL;

ENTITY Full_Adder_tb IS
END Full_Adder_tb;

ARCHITECTURE behavior OF Full_Adder_tb IS
 -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT full_adder --Module for testing declaration
 PORT(
    x : IN std_logic;
    y : IN std_logic;
    z : IN std_logic;
    s : OUT std_logic;
    c : OUT std_logic
 );
 END COMPONENT;

    --Inputs
    signal x : std_logic := '0';
    signal y : std_logic := '0';
    signal z : std_logic := '0';
    --Outputs
    signal s : std_logic;
    signal c : std_logic;

BEGIN
-- Instantiate the Unit Under Test (UUT)
 uut: full_adder PORT MAP (
    x => x,
    y => y,
    z => z,
    s => s,
    c => c
 );
 -- Stimulus process
 stim_proc: process
 begin

 x <='0';--assign values to ALL inputs
 y <='0';
 z <='0';
 wait for 100 ns; --wait for 100ns to see the results
 x <='0'; --assign new values to ALL inputs
 y <='0';
 z <='1';
 wait for 100 ns; --wait for 100ns to see the results
 x <='0'; --assign new values to ALL inputs
 y <='1';
 z <='0';
 wait for 100 ns;
 x <='0';
 y <='1';
 z <='1';
 wait for 100 ns;
 x <='1';
 y <='0';
 z <='0';
 wait for 100 ns;
 x <='1';
 y <='0';
 z <='1';
 wait for 100 ns;
 x <='1';
 y <='1';
 z <='0';
 wait for 100 ns;
 x <='1';
 y <='1';
 z <='1';
 -- insert stimulus here
 wait;
 end process;
END;