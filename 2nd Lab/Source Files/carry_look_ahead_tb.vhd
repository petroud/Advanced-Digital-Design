----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 07.03.2020
-- Design Name: Carry_Look_Ahead_tb
-- Project Name: Laboratory 2
-- Description: Testbench for the 'carry look ahead gen' module
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The entity of the testbench has no ports to be declared; 
entity carry_look_ahead_tb is
end carry_look_ahead_tb;



architecture Behavioral of carry_look_ahead_tb is
-- Declaration and maping of the components tested on this bench;
COMPONENT carry_look_ahead
    PORT(
        P: in std_logic_vector (3 downto 0);
        G: in std_logic_vector (3 downto 0);    
        Cin: in std_logic;
        C: out std_logic_vector (3 downto 0)
    );
END COMPONENT;

--Local declaration of signals to be used in the test bench;
--Inputs
signal P,G,C: std_logic_vector(3 downto 0);   
--Outputs
signal Cin: std_logic;

begin

--Creating an instance of the unit to be tested and Routing of its ports to local signals and ports
cla: carry_look_ahead
    PORT MAP(
        P=>P,
        G=>G,
        Cin=>Cin,
        C=>C   
    );

--Process for assigning values to the inputs of the unit and simulating the workflow
sim_proc: process
    begin
    P <= "0010";
    G <= "0000";
    Cin <= '1';
    wait for 100ns;
    
    P <= "1111";
    G <= "0000";
    Cin <= '1';
    wait for 100ns;
    
    P <= "0000";
    G <= "1111";
    Cin <= '1';
    wait for 100ns;
    
    P <= "0000";
    G <= "0010";
    Cin <= '1';
    wait for 100ns;
    
    P <= "0010";
    G <= "0000";
    Cin <= '0';
    wait for 100ns;
    
    P <= "1111";
    G <= "0000";
    Cin <= '0';
    wait for 100ns;
    
    P <= "0000";
    G <= "1111";
    Cin <= '0';
    wait for 100ns;
    
    wait;
end process;
    
end Behavioral;
