----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers:Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 24.02.2020
-- Design Name: Double-Bit-Adder Testbench
-- Project Name: Laboratory 1
-- Description: 
--This is a testbench that uses the file double_bit_adders.vhd as a component. 
--
----------------------------------------------------------------------------------

LIBRARY ieee; --Libraries Declaration
USE ieee.std_logic_1164.ALL;

ENTITY Double_Bit_Adder_tb IS
END Double_Bit_Adder_tb;

ARCHITECTURE behavior OF Double_Bit_Adder_tb IS
 -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT double_bit_adder     --Module for testing declaration
 PORT( 
    --Inputs
    A: IN std_logic_vector(1 downto 0);
    B: IN std_logic_vector(1 downto 0); 
    cin: IN std_logic;
    --Outputs
    RESULT: OUT std_logic_vector(1 downto 0);
    c1: OUT std_logic
 );
 END COMPONENT;

 --Inputs
signal cin: std_logic;
signal A, B: std_logic_vector(1 downto 0);
--Outputs
signal RESULT: std_logic_vector(1 downto 0);
signal c1 : std_logic;

BEGIN
-- Instantiate the Unit Under Test (UUT)
 uut: double_bit_adder PORT MAP (
 A => A,
 B => B,
 cin => cin,
 RESULT => RESULT,
 c1 => c1
 );
 -- Stimulus process
 stim_proc: process
 begin

 A <= "00";     --assign new values to ALL inputs
 B <= "00";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";     --assign new values to ALL inputs
 B <= "01";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";     --assign new values to ALL inputs
 B <= "10";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";     --assign new values to ALL inputs
 B <= "11";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";     --assign new values to ALL inputs
 B <= "00";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";     --assign new values to ALL inputs
 B <= "01";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "10";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "11";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "00";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "01";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "10";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "11";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "11";
 B <= "00";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "01";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "10";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "11";
 cin <='0';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "00";
 B <= "00";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";
 B <= "01";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";
 B <= "10";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "00";
 B <= "11";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "00";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "01";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "10";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "01";
 B <= "11";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "00";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "01";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "10";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "10";
 B <= "11";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
 A <= "11";
 B <= "00";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "01";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "10";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 
  A <= "11";
 B <= "11";
 cin <='1';
 wait for 100 ns;   --wait for 100ns to see the results
 wait;
 end process;
END;
