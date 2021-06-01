----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Dimitrios Petrou, Georgios Frangias
-- 
-- Create Date: 07.03.2020
-- Design Name: Carry_Gen_Pro_TB
-- Project Name: Laboratory 2
-- Description: Testbench for the 'carry look ahead gen' module
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The entity of the testbench has no ports to be declared; 
entity carry_gen_pro_tb is
end carry_gen_pro_tb;

-- Declaration and maping of the components tested on this bench;
architecture Behavioral of carry_gen_pro_tb is

COMPONENT carry_gen_pro
    PORT(   
       A: in std_logic_vector(3 downto 0);
       B: in std_logic_vector(3 downto 0);
       P: out std_logic_vector(3 downto 0);
       G: out std_logic_vector(3 downto 0)
    );
END COMPONENT;


--Local declaration of signals to be used in the test bench;
--Inputs
signal A,B :STD_LOGIC_VECTOR(3 downto 0); 
--Outputs
signal P,G :STD_LOGIC_VECTOR(3 downto 0);

begin

--Creating an instance of the unit to be tested and Routing of its ports to local signals and ports
cpg0: carry_gen_pro 
PORT MAP(
        A => A,
        B => B,
        P => P,
        G => G
      );
        
--Process for assigning values to the inputs of the unit and simulating the workflow
sim_proc: process
    begin
        A <= "0000";
        B <= "0000";
        wait for 100ns;
        
        A <= "0110";
        B <= "0000";
        wait for 100ns;
        
        A <= "1111";
        B <= "0000";
        wait for 100ns;
        
        A <= "1010";
        B <= "0000";
        wait for 100ns;
        
        A <= "1111";
        B <= "1111";
        wait for 100ns;
        
        A <= "0000";
        B <= "1111";
        wait for 100ns;
        
        A <= "0101";
        B <= "1111";
        wait for 100ns;
        
        A <= "0111";
        B <= "1111";
        wait for 100ns;
        
        A <= "1111";
        B <= "0111";
        wait for 100ns;
        
        A <= "1001";
        B <= "1111";
        wait for 100ns;
        
        A <= "1010";
        B <= "1111";
        wait for 100ns;
        
        A <= "1111";
        B <= "1010";
        wait for 100ns;
        
        A <= "1100";
        B <= "0000";
        wait for 100ns;
        
        A <= "1110";
        B <= "0000";
        wait for 100ns;
        
        A <= "1111";
        B <= "0000";
        wait for 100ns;
      
      wait;
      end process;  
end Behavioral;
