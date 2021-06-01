----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 5 | Stacked 4bit memory with pop and push
-- Create Date: 05.05.2020
-- Design Name:  Memory peripheral testbench
-- Revision 1.0
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_tb is
--  Port ( );
end memory_tb;

architecture Behavioral of memory_tb is

    component memory
        Port (
           ex_clk : in STD_LOGIC;
           ex_rst : in STD_LOGIC;
           ex_we : in STD_LOGIC_VECTOR (0 downto 0);
           ex_addr : in STD_LOGIC_VECTOR (3 downto 0);
           ex_din : in STD_LOGIC_VECTOR (3 downto 0);
           ex_dout : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    

    signal clk_local: STD_LOGIC := '0';
    signal rst_local: STD_LOGIC := '0';
    signal addr,din,dout: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal we: STD_LOGIC := '0';
    
    signal inner_termin: STD_LOGIC :='0';

    
begin
    
    --Routing and mapping component's ports to local signals    
    m0: memory
        Port Map(
            ex_rst=>rst_local,
            ex_clk=>clk_local,
            ex_we(0)=>we,
            ex_addr=>addr,
            ex_din=>din,
            ex_dout=>dout            
        );
    
     ---------------------------------------
    --Process for generating clock signal--
    ---------------------------------------
    clkProcess: process begin
        --Vary the clock signal for low to high every 30ns 
        --Period = 60ns
        clk_local <= '0';
        wait for 30ns;
        clk_local <= '1';
        wait for 30ns;
        
        --The termination flag will be HIGH after a certain time 
        --The clock is generated for this amount of time 
        inner_termin <= '1' after 2000ns;
        
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
    
        --Hold reset for 10 clock cycles
        rst_local<='1';
        wait for 600ns;
        rst_local<='0';

        --Enable writing ability
        we<= '1';
        
        --Write 1111 at address 0001
        addr<= "0001";
        din<= X"a";
		wait for 60ns;
		
		--Write 1011 at address 0010
        addr<= "0010";
        din<= X"b";
		wait for 60ns;
		
		--Write 1010 at address 0011
        addr<= "0011";
        din<= X"c";
		wait for 60ns;
        	    
	    --Disable writing, so we can read
	    din<= X"0";
		we<='0';
		
		--Read from address 0010
		addr<="0010";
		wait for 60ns;
		
		--Read from address 0011
		addr<="0011";
		wait for 60ns;
		
		--Read from address 0001
		addr<="0001";
		wait for 60ns;
		
		--Reset the memory containers
		rst_local<='1';
		wait for 120ns;
	    rst_local<='0';
		
		--Checking the new values of the addresses (after reset)
		addr<="0010";
		wait for 60ns;
		
		addr<="0011";
		wait for 60ns;
		
		addr<="0001";
		wait for 60ns;
			
        wait;
        
    end process;
   
end Behavioral;
