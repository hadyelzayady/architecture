
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity pushpopunit is
port(
	spreg:in std_logic_vector (15 downto 0);
	EXMEM_pushpop,MEMWB_pushpop:in std_logic_vector(1 downto 0); --from control unit push=10 pop =01 
	sp_tomemwb,sp:out std_logic_vector (15 downto 0)
);
end entity pushpopunit;
architecture arch of pushpopunit is
signal spsig:std_logic_vector (15 downto 0);
begin 

sp<= spreg+'1' when EXMEM_pushpop="01" and spreg<"0000010000000000"else
	spreg;

sp_tomemwb<=spreg-'1' when EXMEM_pushpop="10" and (spreg>"0000000000000000" or spreg="0000000000000000") else
	spreg+'1' when EXMEM_pushpop="01"and spreg<"0000010000000000" else
	spreg;


end arch;