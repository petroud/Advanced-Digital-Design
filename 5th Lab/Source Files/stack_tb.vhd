----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 5 | Stacked 4bit memory with pop and push
-- Create Date: 05.05.2020
-- Design Name:  Stack's wrapper entity testbench
-- Revision 1.0
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity stack_tb is
--  Port ( );
end stack_tb;

architecture Behavioral of stack_tb is

component stack
    Port (
        --Inputs
        CLK : in std_logic;
        RST: in std_logic;
        Push: in std_logic;
        Pop: in std_logic;
        NumberIN: in std_logic_vector(3 downto 0);
        
        --Outputs
        NumberOUT: out std_logic_vector(3 downto 0);
        Empty: out std_logic;
        AlmostEmpty: out std_logic;
        AlmostFull: out std_logic;
        Full: out std_logic;
        Address: out std_logic_vector(3 downto 0)
    );
end component;

--Declaration of the local signals used for routing to the ports of the unit under test
signal clk_local, rst_local, push, pop, empty, almostempty, almostfull, full : std_logic;
signal nbrin,nbrout,addr : std_logic_vector(3 downto 0);
signal inner_termin: STD_LOGIC :='0';


begin
    
    --Port mapping
    s0: stack
        Port Map(
            CLK=>clk_local,
            RST=>rst_local,
            Push=>push,
            Pop=>pop,
            Empty=>empty,
            AlmostEmpty=>almostempty,
            AlmostFull=>almostfull,
            Full=>full,
            NumberIN=>nbrin,
            NumberOUT=>nbrout,
            Address=>addr            
        );
    ----------------------------------------------------------------
    --Process for generating a clock signal with termination limit--
    ----------------------------------------------------------------
    clkProcess: process begin
        --Vary the clock signal for low to high every 50ns 
        --Period = 100ns
        clk_local <= '0';
        wait for 50ns;
        clk_local <= '1';
        wait for 50ns;
        
        --The termination flag will be HIGH after a certain time 
        --The clock is generated for this amount of time 
        inner_termin <= '1' after 5000ns;
        
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
        wait for 1000ns;    
        
        --For the rest of the testing process reset will not be active
        rst_local<='1';

        --Push for 100ns = 1 number
        nbrin<="0001";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="0010";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="0011";
        push<='1';
        pop<='0';
        wait for 100ns;
        
         --Push for 100ns = 1 number
        nbrin<="0100";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="0101";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="0110";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="0111";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="1000";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        --Push for 100ns = 1 number
        nbrin<="1001";
        push<='1';
        pop<='0';
        wait for 100ns;
        
        
        --Push for 100ns = 1 number
        nbrin<="1100";
        push<='1';
        pop<='0';
        wait for 100ns; 
        
        --Reset input signals
        nbrin<="0000";
        push<='0';
        
        --Wait while doing nothing for 10 clock cycles
        wait for 1000ns;
        
        --Start poping numbers for 15 clock cycles
        pop<='1';
        wait for 1500ns; 
        --Stop poping
        pop<='0';
        
        --Reset the output
        rst_local<='0';
        wait for 100ns;
        
        wait;
    end process;

end Behavioral;
