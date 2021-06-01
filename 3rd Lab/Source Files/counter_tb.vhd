----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Lab 3 | Strange Counter Testbench
-- Create Date: 06.04.2020
-- Design Name: Strange Counter
-- Revision 1.00
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
use ieee.std_logic_arith.all;
 
-- The entity of the testbench has no ports to be declared; 
entity counter_tb is
end counter_tb;


architecture Behavioral of counter_tb is

    component COUNTER
        port(
            --Module inputs
            CLK: in STD_LOGIC;
            RST: in STD_LOGIC;
            Control: in STD_LOGIC_VECTOR(2 DOWNTO 0);
            
            --Module outputs
            Count: out STD_LOGIC_VECTOR(7 DOWNTO 0);
            Overflow: out STD_LOGIC;
            Underflow: out STD_LOGIC;
            Valid: out STD_LOGIC        
        );
    end component;

    signal rstLocal, OverLocal, UnderLocal, ValidLocal : STD_LOGIC;
    signal clk : std_logic := '0';

    signal countLocal: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ctrlLocal: STD_LOGIC_VECTOR(2 DOWNTO 0);
    
    begin

        c1: counter 
        PORT MAP(
            --Input mapping
            CLK=>clk,
            RST=>rstLocal,
            Control=>ctrlLocal,
            
            --Output mapping
            Count=> countLocal,
            Overflow=> OverLocal,
            Underflow=> UnderLocal,
            Valid=> ValidLocal
        );

        simproc: process
            begin
                --1) If reset is HIGH then the counter is frozen regardless the input (control)
                
                --Set reset to HIGH
                rstLocal<='1';

                --Simulating the clock and assigning different values to control input
                clk <= not clk after 25ns; 
                ctrlLocal<= "101";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "111";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "001";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "000";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "110";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "010";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "100";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "101";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "111";
                wait for 50ns;
                
                clk <= not clk after 25ns;
                ctrlLocal<= "001";
                wait for 50ns;
                
                --End of simulation, part 1
          
          
          
                -- ******** 2nd Simulation case *********
                --Increase the counter's output to simulate overflow 
                
                --A random increasing counting step
                ctrlLocal<="111";
                rstLocal<='0';
                for I in 1 to 46 loop
                    clk <= not clk after 25ns;
                    wait for 50ns;
                end loop;
                
                clk <= not clk after 25ns;
                rstLocal<='1';
                wait for 50ns;
                --End of simulation, part 2


                -- ******** 3rd Simulation case *********
                --Increase the counter's output, in order to simulate overflow during reduction later
                
                ctrlLocal<="110";
                rstLocal<='0';
              
                clk <= not clk after 25ns;
                wait for 50ns;
                              
                clk <= not clk after 25ns;
                wait for 50ns;
                
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Start decreasing the counter, to achieve a state capable to cause overflow
                ctrlLocal<="000";
                rstLocal<='0';
                for I in 1 to 3 loop
                    clk <= not clk after 25ns;
                    wait for 50ns;
                end loop;
                
                --Give 2 clocks to show the frozen state
                clk <= not clk after 25ns;
                wait for 50ns;
                
                clk <= not clk after 25ns;
                wait for 50ns;

                --Give reset signal to begin counting again
                clk <= not clk after 25ns;
                rstLocal<='1';
                wait for 50ns;   
                
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --A random counting step applied
                ctrlLocal<="101";
                rstLocal<='0';
                
                --Give some clocks to perform counting
                clk <= not clk after 25ns;
                wait for 50ns;
                
                clk <= not clk after 25ns;
                wait for 50ns;
                
                clk <= not clk after 25ns;
                wait for 50ns;
                
                clk <= not clk after 25ns;
                wait for 50ns;
         
         
                --End of simulation, part 3
                
                
                -- ********* 4th Simulation case *********
                --Between clock cycles we can change the control input to vary the counting step
                
                --Give reset signal to begin from zero
                clk <= not clk after 25ns;
                rstLocal<='1';
                wait for 50ns; 
                
                --Assigning a random increasing step and setting reset to LOW;
                ctrlLocal<="011";  
                rstLocal<='0';
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Another step
                --Assigning a random increasing step;
                ctrlLocal<="101";  
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Another step
                --Assigning a random increasing step;
                ctrlLocal<="100";  
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Another step
                --Assigning a random increasing step;
                ctrlLocal<="111";  
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                
                --Another step
                --Assigning a random increasing step;
                ctrlLocal<="110";  
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;  
                
                --Give a clock
                clk <= not clk after 25ns;
                wait for 50ns;           
                
                --End of Simulation, part 4
                
                --END OF SIMULATION
       
            wait;
        end process;
end Behavioral;
