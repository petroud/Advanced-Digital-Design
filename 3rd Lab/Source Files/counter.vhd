----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Lab 3 | Strange Counter
-- Create Date: 06.04.2020
-- Design Name: Strange Counter
-- Revision 1.00
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter is
     Port (
        --Entity inputs
        CLK: in STD_LOGIC; --Clock signal
        RST: in STD_LOGIC; --Reset signal (synchronous)
        Control: in STD_LOGIC_VECTOR(2 DOWNTO 0); --Control signal for setting the counting step
        
        --Entity outputs
        Count: out STD_LOGIC_VECTOR(7 DOWNTO 0); --The adjustable number output of the counter
        Overflow: out STD_LOGIC;  --Signal to show overflow 
        Underflow: out STD_LOGIC; --Signal to show underflow
        Valid: out STD_LOGIC --Signal as a flag used to check the validity of the counting process
      );
end counter;

--Implementation of the architecture of the entity
architecture Behavioral of counter is
    
    --Local signals used for routing in the counting process / respective to the output of the entity
    signal cnt: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ovrfl,undrfl,vld: STD_LOGIC;
    
begin
    process begin
        WAIT UNTIL CLK'EVENT AND CLK = '1';
            
        --When reset is activated then we start again from the beginning
        --Reset is synchronous
        if (RST='1') then
            --Reset every output signal to the normal state
            cnt<="00000000";
            ovrfl<='0';
            undrfl<='0';
            vld<='1';
        else --If there is no reset applied we may count
        
            --We check if we can continue to the next number using the Valid signal
            if(vld='1') then
                --Cases for the counting step, based on the 'Control' signal
                
                if(Control="000") then
                    --Underflow check
                    if cnt<5 then
					   undrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt-5;
                    end if;
                    
                elsif(Control="001") then
                    --Underflow check
                    if cnt<2 then
					   undrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt-2;
                	end if;
                	
                elsif(Control="010") then
                    --Do nothing
                    cnt<=cnt;
                    
                elsif(Control="011") then
                    --Overflow check
                    if cnt>254 then
					   ovrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt+1;
                	end if;
                	
                elsif(Control="100") then
                    --Overflow check
                    if cnt>253 then
					   ovrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt+2;
                	end if;
                	
                elsif(Control="101") then
                    --Overflow check
                    if cnt>250 then
					   ovrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt+5;
                	end if;
                	
                elsif(Control="110") then
                    --Overflow check
                    if cnt>249 then
					   ovrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt+6;
                	end if;
                elsif(Control="111") then
                    --Overflow check
                    if cnt>243 then
					   ovrfl<='1';
                	   vld<='0';
                    else
                	   cnt<=cnt+12;
                	end if;
                else 
                    --If an unknown control signal is applied then stop the counting process
                    vld<='0';
                    undrfl<='1';
                    ovrfl<='1';
                end if; --if condition for 'control' ends here
            
            else
                --The counter state is the same as before if the counting process was interrupted previously (Valid=0)
                vld<=vld;
                undrfl<=undrfl;
                ovrfl<=ovrfl;
                cnt<=cnt;
            end if; --if condition for 'valid' ends here
       
        end if; --if condition for 'reset' ends here  
    
    end process;
    
    --Routing the local signals to the ports of the entity
    Count<=cnt;
    Valid<=vld;
    Overflow<=ovrfl;
    Underflow<=undrfl;
       
end Behavioral;
