----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 4 | Meally FSM Testbench
-- Create Date: 16.04.2020
-- Design Name: Meally FSM with 5 states
-- Revision 1.00
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The entity of the testbench has no ports to be declared; 
entity fsm_tb is
end fsm_tb;

architecture Behavioral of fsm_tb is

    --Declaration of the component used in the architecture implementation below
    COMPONENT fsm 
        Port (
            CLK: in std_logic;
            RSTn: in std_logic;
            A: in std_logic;
            B: in std_logic;
            Control: out std_logic_vector(2 downto 0)    
        );
    END COMPONENT;
    
    --Local signals used for port mapping 
    signal rst_local, a_local, b_local : STD_LOGIC;
    signal ctrl_local: STD_LOGIC_VECTOR(2 downto 0);
    signal clk_local : STD_LOGIC :='0';
    
    --Signal used as flag for the termination of the clock generator
    signal inner_termin: STD_LOGIC :='0';
    

begin
    
    --Driving the local signals to the ports of a module of the component 'fsm'
    f0: fsm
        PORT MAP(
            CLK => clk_local,
            RSTn => rst_local,
            A => a_local,
            B => b_local,
            Control => ctrl_local
        );
    
   
    --Process for generating clock signal 
    clkProcess: process begin
        --Vary the clock signal for low to high every 30ns 
        --Period = 60ns
        clk_local <= '0';
        wait for 30ns;
        clk_local <= '1';
        wait for 30ns;
        
        --The terminationg flag will be HIGH after a certain time 
        --The clock is generated for this amount of time 
        inner_termin<='1' after 2500ns;
        
        --Checking if we should terminate the clock generation
        if inner_termin ='1' then
            clk_local<='0';  --Set clock signal to low 
            wait; --End the clock generation process
        end if;
       
    end process;
    
    
    --Process for assigning values to the inputs and testing the FSM 
    simProcess: process begin
    
        --Hold reset for approximately 10 clock cycles
        rst_local<='0'; --Reset is active on LOW
        wait for 600ns;
        
        --For the rest of the testing process reset will not be active
        rst_local<='1';
     
        --1st Cycle of testing : Moving anti-clockwise (increasing state) and holding short for 2 clock cycles at each state
        --Hold 
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
                
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        
        --2nd Cycle of testing: Moving clockwise (decreasing state) and holding short for 2 clock cycles at each state
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
                
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold        
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold 
        a_local<='1';
        b_local<='1';
        wait for 120ns;
        
        --3rd Cycle of testing: Moving randomly and holding short for 2 clock cycles at each state
        
        --Reset the FSM
        rst_local<='0'; --Reset is active on LOW
        wait for 60ns;
        --For the rest of the testing process reset will not be active
        rst_local<='1';
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
       
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
        --Previous state
        a_local<='0';
        b_local<='1';
        wait for 60ns;
        
        --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
        --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
         --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
         --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
         --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
         --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
         --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
         --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
         --Hold
        a_local<='0';
        b_local<='0';
        wait for 60ns;
        
         --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
         --Hold
        a_local<='1';
        b_local<='1';
        wait for 60ns;
        
         --Next state
        a_local<='1';
        b_local<='0';
        wait for 60ns;
        
        --Hold
        a_local<='0';
        b_local<='0';
        wait for 120ns;
        
        
        --End of the testing process
        wait;    
    end process;
    
 end Behavioral;
