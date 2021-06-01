library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum_tb is
end sum_tb;

architecture Behavioral of sum_tb is
COMPONENT sum
    PORT(
        P: in std_logic_vector (3 downto 0);
        C: in std_logic_vector (2 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector (3 downto 0) 
    );
END COMPONENT;
signal P,S: std_logic_vector (3 downto 0);
signal C: std_logic_vector (2 downto 0);
signal Cin: std_logic;

begin

su: sum PORT MAP(
    P=>P,
    C=>C,
    Cin=>Cin,
    S=>S
    );
    
sim_proc: process
    begin
    
    P<="1111";
    C<="0000";
    Cin<='1';
    wait for 100ns;
    
    P<="0000";
    C<="1111";
    Cin<='1';
    wait for 100ns;
    
    P<="0010";
    C<="0101";
    Cin<='1';
    wait for 100ns;
    
    P<="0101";
    C<="1010";
    Cin<='1';
    wait for 100ns;

    P<="0110";
    C<="0000";
    Cin<='0';
    wait for 100ns;
    
    P<="1111";
    C<="0000";
    Cin<='0';
    wait for 100ns;
    
    P<="0000";
    C<="1111";
    Cin<='0';
    wait for 100ns;
    
    wait;
    
end process;
end Behavioral;
