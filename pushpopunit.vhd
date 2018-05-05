
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity pushpopunit is
port(
	EXMEM_SP,MEMWB_SP:in std_logic_vector (15 downto 0);
	EXMEM_pushpop,MEMWB_pushpop:in std_logic_vector(3 downto 0); --from control unit push=10 pop =01 
	sp_tomemwb,sp:out std_logic_vector (15 downto 0)
	
	
	

);
end entity pushpopunit;
architecture arch of pushpopunit is
signal spsig:std_logic_vector (15 downto 0);
begin 

spsig<=MEMWB_SP when MEMWB_pushpop="10" or MEMWB_pushpop="01" else
	EXMEM_SP;
sp<= spsig+'1' when EXMEM_pushpop="01"else
	spsig;

sp_tomemwb<=spsig-'1' when EXMEM_pushpop="10" and spsig>"0000000000000001" else
	spsig+'1' when EXMEM_pushpop="01"and spsig>"0000000000000001" else
	spsig;
end arch;