----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 4 | Meally FSM
-- Create Date: 16.04.2020
-- Design Name: Meally FSM with 5 states
-- Revision 1.00
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    Port (
        --Entity inputs
        CLK: in std_logic;
        RSTn: in std_logic;
        A: in std_logic;
        B: in std_logic;
        --Entity outputs
        Control: out std_logic_vector(2 downto 0)    
    );
end fsm;

--Implementation of the architecture of the entity
architecture Behavioral of fsm is
    --Declaring the FSM states
    TYPE StateType IS (S0,S1,S2,S3,S4);
    --Local signal of the type StateType
    SIGNAL st: StateType;   
begin
    PROCESS
    BEGIN
        WAIT UNTIL CLK'EVENT AND CLK ='1';
        
        --When reset is activated then we start again from state 0 and control '000'
        --Reset is synchronous
        if RSTn='0' then
            st <= S0;
            Control<="000";
        else
            case st is
               
               --When in state 0
                when S0=> 
                   if (A='0' AND B='1') then    --if input= '01'
                       Control<="100";          -->state 4
                       st<=S4;
                   elsif ((A='1' AND B='1') OR (A='0' AND B='0')) then --if input= '00' or '11'
                       Control<="000";          -->state 0
                       st<=S0;                      
                   elsif (A='1' AND B='0') then --if input= '10'
                       Control<="001";          -->state 1
                       st<=S1;
                   else
                       st<=S0;                        
                   end if;
                   
                --When in state 1
                when S1=>
                
                   if (A='0' AND B='1') then    --if input= '01'
                       Control<="000";          -->state 0
                       st<=S0;
                   elsif ((A='1' AND B='1') OR (A='0' AND B='0')) then --if input= '00' or '11'  
                       Control<="001";          -->state 1
                       st<=S1;                      
                   elsif (A='1' AND B='0') then --if input= '10'
                       Control<="010";          -->state 2
                       st<=S2;
                   else
                       st<=S1;                        
                   end if;
                    
                --When in state 2
                when S2=>
                   
                   if (A='0' AND B='1') then    --if input= '01'
                       Control<="001";          -->state 1
                       st<=S1;
                   elsif ((A='1' AND B='1') OR (A='0' AND B='0')) then --if input= '00' or '11'
                       Control<="010";          -->state 2
                       st<=S2;                      
                   elsif (A='1' AND B='0') then --if input= '10'
                       Control<="011";          -->state 3
                       st<=S3;
                   else
                       st<=S3;                        
                   end if;
                
                --When in state 3
                when S3=>
                
                   if (A='0' AND B='1') then    --if input= '01'
                       Control<="010";          -->state 2
                       st<=S2;
                   elsif ((A='1' AND B='1') OR (A='0' AND B='0')) then --if input= '00' or '11'
                       Control<="011";          -->state 3
                       st<=S3;                      
                   elsif (A='1' AND B='0') then --if input= '10'
                       Control<="100";          -->state 4
                       st<=S4;
                   else
                       st<=S3;                        
                   end if;
                
                --When in state 4
                when S4=>
               
                   if (A='0' AND B='1') then    --if input= '01'
                       Control<="011";          -->state 3
                       st<=S3;
                   elsif ((A='1' AND B='1') OR (A='0' AND B='0')) then --if input= '00' or '11'
                       Control<="100";          -->state 4
                       st<=S4;                      
                   elsif (A='1' AND B='0') then --if input= '10'
                       Control<="000";          -->state 0
                       st<=S0;
                   else
                       st<=S4;                        
                   end if;
                
            end case;       
        end if;
        
    END PROCESS;        

end Behavioral;
