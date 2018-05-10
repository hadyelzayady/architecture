
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity pushpopunit is
port(
	spreg:in std_logic_vector (15 downto 0);
	EXMEM_pushpop,MEMWB_pushpop,RTI:in std_logic_vector(1 downto 0); --from control unit push=10 pop =01 
	int:in std_logic;
	sp_tomemwb,sp:out std_logic_vector (15 downto 0)
);
end entity pushpopunit;
architecture arch of pushpopunit is
signal spsig:std_logic_vector (15 downto 0);
signal returnfrominterrupt:std_logic;
begin
returnfrominterrupt <='1' when RTI="11" else '0';

sp<= spreg+'1' when EXMEM_pushpop="01"  and  returnfrominterrupt='0'  and spreg<"0000010000000000"else
	spreg+"10" when returnfrominterrupt='1' else
	spreg;

sp_tomemwb<=spreg-'1' when EXMEM_pushpop="10" and (spreg>"0000000000000000" or spreg="0000000000000000") and int='0'and  returnfrominterrupt='0' else
	spreg+'1' when EXMEM_pushpop="01"and  int='0'and returnfrominterrupt='0' and spreg<"0000010000000000" else
	spreg-"10" when int='1'else
	spreg +"10" when returnfrominterrupt='1'else 
	spreg;


end arch;