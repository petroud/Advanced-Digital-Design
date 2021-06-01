library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum is
port ( 
    P: in std_logic_vector (3 downto 0);
    C: in std_logic_vector (2 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector (3 downto 0) 
    );
end sum;

architecture Behavioral of sum is

begin
    S(0) <= P(0) xor Cin;
    S(1) <= P(1) xor C(0);
    S(2) <= P(2) xor C(1);
    S(3) <= P(3) xor C(2);
end Behavioral;
