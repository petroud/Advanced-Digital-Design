----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 5 | Stacked 4bit memory with pop and push
-- Create Date: 05.05.2020
-- Design Name:  Stack's addressing controller
-- Revision 1.2
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 

--Declaration of the ports of the entity
entity control is
    Port (
        --Inputs
        CLK: in std_logic;
        RST: in std_logic;
        Push: in std_logic;
        Pop: in std_logic;
        
        --Outputs
        Empty: out std_logic;
        AlmostEmpty: out std_logic;
        Full: out std_logic;
        AlmostFull: out std_logic;
        
        wrten: out std_logic_vector(0 downto 0);     
        address: out std_logic_vector(3 downto 0)
    );
end control;

--Implementation of the architecture of the entity
  architecture Behavioral of control is
    
    --Declaring the FSM states as a type of signal
    type StateType is (sEmpty, sAlmEmpty, sRegular, sAlmFull, sFull);
    --State type local signal, used as the FSM state indicator at each clock cycle
    signal state: StateType;
    
    --A local signal used to keep track of the write enable 
    signal temp_wrten: std_logic_vector(0 downto 0);

    --A local signal used to keep track of the address at current index in memory 
    signal temp_address: std_logic_vector(3 downto 0) :="0000";

    --Bus used to transfer the stack's capacity indicators over the various states
    ------- MSB -------
    -- 3: empty signal
    -- 2: almost empty signal
    -- 1: almost full signal
    -- 0: full signal
    ------- LSB -------
    signal indBus: std_logic_vector(3 downto 0);
    
    

begin
    
    --Process implementing the FSM state succession, inputs, outputs and sequences
    process begin
        --The process waits for the clock's positive edge
        WAIT UNTIL CLK'EVENT AND CLK ='1';
        
        temp_wrten(0)<='0';

        
        --When reset is activated then we start again from the "Empty" state and zero address
        --Reset is synchronous and active on LOW
        if(RST='0') then
            state<=sEmpty;
            temp_address<="0000";
            indBus<="1000";        
            temp_wrten(0)<='0';
        else
            --Case structure implementing the sequence of the states
            case state is
                ----------------------
                --At the empty state--
                ----------------------
                when sEmpty=>
                
                    temp_address<="0000";
                    
                    --If we are performing PUSH
                    if((Pop='0') AND (Push='1')) then
                        --The address is increased by 1 and we move on to the almost empty state
                        --since we have at least 1 element in the stack
                        temp_wrten(0) <='1';
                        temp_address<=temp_address+1;
                        indBus<="0100"; --AlmostEmpty='1'
                        state<=sAlmEmpty;
                    --For any other combination of inputs do nothing
                    else
                        indBus<="1000";
                        temp_wrten(0) <='0';
                        state<=sEmpty;
                    end if;       
                    
               
               
                -----------------------------  
                --At the almost empty state--
                -----------------------------
                when sAlmEmpty=>

                    --If we are performing PUSH
                    if((Pop='0') AND (Push='1')) then
                        --If we already have 3 elements then the list is not almost empty
                        --so we continue to the regular state 
                        
                        if(temp_address=3) then
                            temp_wrten(0) <='1';
                            temp_address<=temp_address+1;
                            indBus<="0000"; --everything='0'
                            state<=sRegular;
                        --Else we have less than 3 elements, so we stay at the almost empty state
                        else
                            temp_wrten(0) <='1';
                            temp_address<=temp_address+1;
                            indBus<="0100"; --AlmostEmpty='1'
                            state<=sAlmEmpty;
                        end if;
                    
                    --If we are performing POP
                    elsif((Pop='1') AND (Push='0')) then
                       --If only one element is left then after POPing it we move to the empty state
                        if(temp_address=1) then
                            
                            temp_wrten(0) <='0';    
                            indBus<="1000"; --Empty='1'
                            state<=sEmpty;
                        else
                        --Else we simply POP the element and we stay at the almost empty state
                            temp_address<=temp_address-1;
                            temp_wrten(0) <='0';
                            indBus<="0100"; --AlmostEmpty='1'
                            state<=sAlmEmpty;                       
                        end if;
                    --For any other combination of inputs do nothing
                    else
                        temp_wrten(0) <='0';
                        indBus<="0100"; --AlmostEmpty='1'
                        state<=sAlmEmpty;
                    end if;
                   
                    

                ------------------------ 
                --At the regural state--
                ------------------------
                when sRegular=>
                    
                    --If we are performing push
                    if((Push='1') AND (Pop='0')) then
                       
                        --If we already have 7 elements then after pushing the next state will be : almost full 
                        if(temp_address=7) then
                            temp_address<=temp_address+1;
                            temp_wrten(0) <='1';
                            indBus<="0010"; --AlmostFull='1'
                            state<=sAlmFull;    
                        --Else we push the new element and we stay at the regural state
                        else
                            temp_address<=temp_address+1;
                            temp_wrten(0) <='1';
                            indBus<="0000"; --everything='0'
                            state<=sRegular;
                        end if;
                    
                    --If we are performing POP
                    elsif((Push='0') AND (Pop='1')) then
                        --If we have 4 elements left then after poping the next state will be : almost empty
                        if(temp_address=4) then
                            temp_address<=temp_address-1;
                            temp_wrten(0) <='0';
                            indBus<="0100"; --AlmostEmpty='1'
                            state<=sAlmEmpty;
                        --Else we pop the element and we stay at the regular state
                        else
                            temp_address<=temp_address-1;
                            temp_wrten(0) <='0';
                            indBus<="0000"; --everything='0'
                            state<=sRegular;
                        end if;
                    --For any other combination of inputs do nothing
                    else
                        temp_wrten(0) <='0';
                        indBus<="0000"; --everything='0'
                        state<=sRegular;
                    end if;
                  

                  
                ----------------------------
                --At the almost full state--
                ---------------------------- 
                when sAlmFull=> 
                    
                    --If we are performing PUSH
                    if((Push='1') AND (Pop='0')) then
                        --If we already have 9 elements then after pushing the new one the stack will be full
                        --so we move on to the full state
                        if(temp_address=9) then
                            temp_address<=temp_address+1;
                            temp_wrten(0) <='1';
                            indBus<="0001"; --Full='1'
                            state<=sFull;
                        --Else we simply we push the new element and stay at the almost full state
                        else
                            temp_address<=temp_address+1;
                            temp_wrten(0) <='1';
                            indBus<="0010"; --AlmostFull='1'
                            state<=sAlmFull;
                        end if;
                   
                   --If we are performing POP     
                   elsif((Push='0') AND (Pop='1')) then
                        
                        --If we have 8 elements then after POPing we move on to the regular state 
                        --since the stack is not anymore almost full
                        if(temp_address=8) then
                            temp_address<=temp_address-1;
                            temp_wrten(0) <='0';
                            indBus<="0000"; --everything='0'
                            state<=sRegular;
                        --Else we simply pop the first element and we stay at the almost full state
                        else
                            temp_address<=temp_address-1;
                            temp_wrten(0) <='0';
                            indBus<="0010"; --AlmostFull='1'
                            state<=sAlmFull;
                        end if;
                   --For any other combination of inputs do nothing
                   else
                        temp_wrten(0) <='0';
                        indBus<="0010";
                        state<=sAlmFull;
                   end if;
                  

               
                ---------------------  
                --At the full state--
                ---------------------
                when sFull=>
                
                   --If we are performing POP we simply pop the first element and we 
                   --move on to the almost full state
                   if((Push='0') AND (Pop='1')) then
                        temp_address<=temp_address-1;
                        temp_wrten(0) <='0';
                        indBus<="0010"; --AlmostFull='1'
                        state<=sAlmFull;
                   --For any other combination of inputs do nothing
                   else
                        temp_wrten(0) <='0';
                        indBus<="0001"; --Full='1';
                        state<=sFull;
                   end if;
                   
        
            end case;
        end if;
    end process;
 
    --Route local signals to entity ports
    Empty<=indBus(3);
    AlmostEmpty<=indBus(2);
    AlmostFull<=indBus(1);
    Full<=indBus(0);
    address<=temp_address;
    wrten(0)<=temp_wrten(0);


end Behavioral;
