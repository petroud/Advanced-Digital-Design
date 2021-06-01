----------------------------------------------------------------------------------
-- Institution: Technical University of Crete
-- Engineers: Georgios Frangias,  Dimitrios Petrou 
-- 
-- Advanced Digital Design
-- Lab 5 | Stacked 4bit memory with pop and push
-- Create Date: 05.05.2020
-- Design Name:  Stack's wrapper entity
-- Revision 1.0
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Declaration of the ports of the entity
entity stack is
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
end stack;

--Implementation of the architecture of the entity
architecture Behavioral of stack is
    
    --Declaration of the memory controller component
    component control                                                
        Port (
            --Inputs
            CLK: in std_logic;
            RST: in std_logic;
            Push: in std_logic;
            Pop: in std_logic;
            
            --Outputs
            Empty: out std_logic;
            AlmostEmpty: out std_logic;
            AlmostFull: out std_logic;
            Full: out std_logic;
            
            wrten: out std_logic_vector(0 downto 0);
            address: out std_logic_vector(3 downto 0)
        );
    end component;
    
    --Declaration of the memory peripheral component
    component memory
        port (
            ex_addr : in STD_LOGIC_VECTOR (3 downto 0);
            ex_clk : in STD_LOGIC;
            ex_din : in STD_LOGIC_VECTOR (3 downto 0);
            ex_dout : out STD_LOGIC_VECTOR (3 downto 0);
            ex_rst : in STD_LOGIC;
            ex_we : in STD_LOGIC_VECTOR (0 to 0)
        );
    end component;
    
    --Local signals used for port mapping
    signal localAddr:std_logic_vector(3 downto 0);
    signal localWrt: std_logic_vector(0 to 0);
    signal rstNot: std_logic;

begin
    
    rstNot<= NOT RST;
    Address<=localAddr;      
    
    --Instantiation and port mapping for the control unit
    c0: control
        Port Map(
            CLK=>CLK,
            RST=>RST,
            Push=>Push,
            Pop=>Pop,
            Empty=>Empty,
            AlmostEmpty=>AlmostEmpty,
            AlmostFull=>AlmostFull,
            Full=>Full,
            wrten(0)=>localWrt(0),
            address=>localAddr
        );
    
    --Instantiation and port mapping for the memory unit
    m0: memory
        Port Map(
            ex_addr=>localAddr,
            ex_clk=>CLK,
            ex_din=>NumberIN,
            ex_dout=>NumberOUT,
            ex_rst=>rstNot,
            ex_we(0)=>localWrt(0)
        );
        
    
end Behavioral;
