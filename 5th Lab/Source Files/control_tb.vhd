----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 5 | Stacked 4bit memory with pop and push
-- Create Date: 05.05.2020
-- Design Name:  Stack's addressing controller testbench
-- Revision 1.0
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The testbench entity has no ports to be declared
entity control_tb is
--  Port ( );
end control_tb;

-- Implementation of the architecture of the testbench module
architecture Behavioral of control_tb is

--Declarationg of the compononents used in the testing process
component control 
    Port (
        CLK: in std_logic;
        RST: in std_logic;
        Push: in std_logic;
        Pop: in std_logic;
        
        Empty: out std_logic;
        AlmostEmpty: out std_logic;
        Full: out std_logic;
        AlmostFull: out std_logic;
        
        address: out std_logic_vector(3 downto 0);
        wrten: out std_logic_vector(0 downto 0)
    );
end component;


--Local signals, used to be routed to the component's ports
signal clk_local,rst_local,push_local,pop_local : std_logic;
signal inner_termin: STD_LOGIC :='0';
signal tAdd: std_logic_vector(3 downto 0) :="0000";
signal tEmpty,tAEmpty,tFull,tAFull: std_logic;
signal twrten: std_logic_vector(0 downto 0);


begin
    
    --Routing and mapping component's ports to local signals    
    c0: control
        Port map(
            CLK=>clk_local,
            RST=>rst_local,
            Push=>push_local,
            Pop=>pop_local,
            Empty=>tEmpty,
            Full=>tFull,
            AlmostEmpty=>tAEmpty,
            AlmostFull=>tAFull,
            address=>tAdd,   
            wrten=>twrten         
        );


    ---------------------------------------
    --Process for generating clock signal--
    ---------------------------------------
    clkProcess: process begin
        --Vary the clock signal for low to high every 30ns 
        --Period = 60ns
        clk_local <= '1';
        wait for 30ns;
        clk_local <= '0';
        wait for 30ns;
        
        --The termination flag will be HIGH after a certain time 
        --The clock is generated for this amount of time 
        inner_termin <= '1' after 2500ns;
        
        --Checking if we should terminate the clock generation
        if inner_termin ='1' then
            clk_local<='0';  --Set clock signal to low 
            wait; --End the clock generation process
        end if;
       
    end process;
    
    
    -------------------
    --Testing process--
    -------------------
    simProcess: process begin
        --Hold reset for approximately 10 clock cycles
        rst_local<='0'; --Reset is active on LOW
        wait for 600ns;    
        
        --For the rest of the testing process reset will not be active
        rst_local<='1';
        
        --Try giving invalid input
        push_local<='0';
        pop_local<='0';
        wait for 60ns;
        
        --Push for 180ns = 3 numbers      
        push_local<='1';
        pop_local<='0';
        wait for 180ns;
        
        --Try giving invalid input        
        push_local<='1';
        pop_local<='1';
        wait for 60ns;
        
        --Pop for 60ns = 1 number
        push_local<='0';
        pop_local<='1';
        wait for 60ns;
        
        --Push for 360ns = 6 numbers
        push_local<='1';
        pop_local<='0';
        wait for 360ns;
        
        --Pop for 60ns = 1 number
        push_local<='0';
        pop_local <= '1';
        wait for 60ns;
        
        --Push for 180ns = 3 numbers
        push_local<='1';
        pop_local <= '0';
        wait for 180ns;
        
        --Push for 120ns = 2 numbers
        push_local<='1';
        pop_local <= '0';
        wait for 120ns;
        
        --Pop for 180ns = 3 numbers
        push_local<='0';
        pop_local<='1';
        wait for 180ns;
        
        --Try giving invalid input
        push_local<='0';
        pop_local<='0';
        wait for 180ns;
        
        --Reset the FSM
        rst_local<='0';
        wait for 60ns;
        
        wait;
    end process;


end Behavioral;
