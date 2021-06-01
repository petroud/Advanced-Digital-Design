----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Equations Testbench
-- Module Name: equations - Behavioral
-- Project Name: Laboratory 1
-- Description: 
--This is a testbench that uses the file equations.vhd as a component. 
--It checks all the possible combinations of the inputs A and B and checks the 
--results when C(0-5) are all '0' and all '1' 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity equations_testbench is
end equations_testbench;

architecture Behavioral of equations_testbench is
--Component 'equations' Declaration for the Unit Under Test (UUT) 
COMPONENT equations
PORT(
    --Inputs
    A: IN std_logic;
    B: IN std_logic;
    C0: IN std_logic;
    C1: IN std_logic;
    C2: IN std_logic;
    C3: IN std_logic;
    C4: IN std_logic;
    C5: IN std_logic;
    --Outputs
    RESULT: OUT std_logic_vector(5 downto 0)
);
END COMPONENT;
--Initializing all inputs to '0'
signal A: std_logic :='0';
signal B: std_logic :='0';
signal C0: std_logic :='0';
signal C1: std_logic :='0';
signal C2: std_logic :='0';
signal C3: std_logic :='0';
signal C4: std_logic :='0';
signal C5: std_logic :='0';

signal RESULT: std_logic_vector(5 downto 0);

begin

-- Instantiate the Unit Under Test (UUT)
uut:equations PORT MAP(
    
    A => A,
    B => B,
    C0 => C0,
    C1 => C1,
    C2 => C2,
    C3 => C3,
    C4 => C4,
    C5 => C5,  
    RESULT => RESULT
);

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.

    --C(0-5) = '1'
    A <='0';    --assign values to ALL inputs
    B <='0';
    C0 <='1';
    C1 <='1';
    C2 <='1';
    C3 <='1';
    C4 <='1';
    C5 <='1';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='0';    --assign values to ALL inputs
    B <='1';
    C0 <='1';
    C1 <='1';
    C2 <='1';
    C3 <='1';
    C4 <='1';
    C5 <='1';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='1';    --assign values to ALL inputs
    B <='0';
    C0 <='1';
    C1 <='1';
    C2 <='1';
    C3 <='1';
    C4 <='1';
    C5 <='1';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='1';    --assign values to ALL inputs
    B <='1';
    C0 <='1';
    C1 <='1';
    C2 <='1';
    C3 <='1';
    C4 <='1';
    C5 <='1';
    wait for 100ns;  --wait for 100ns to see the results
    
    --C(0-5) = '0'
    A <='0';    --assign values to ALL inputs
    B <='0';
    C0 <='0';
    C1 <='0';
    C2 <='0';
    C3 <='0';
    C4 <='0';
    C5 <='0';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='0';    --assign values to ALL inputs
    B <='1';
    C0 <='0';
    C1 <='0';
    C2 <='0';
    C3 <='0';
    C4 <='0';
    C5 <='0';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='1';    --assign values to ALL inputs
    B <='0';
    C0 <='0';
    C1 <='0';
    C2 <='0';
    C3 <='0';
    C4 <='0';
    C5 <='0';
    wait for 100ns;  --wait for 100ns to see the results
    
    A <='1';    --assign values to ALL inputs
    B <='1';
    C0 <='0';
    C1 <='0';
    C2 <='0';
    C3 <='0';
    C4 <='0';
    C5 <='0';
    wait for 100ns;  --wait for 100ns to see the results
    
    -- wait for <clock>_period*10;
    wait;
    end process;
    
END;