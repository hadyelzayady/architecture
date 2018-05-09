library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity hazardunit is
port(
	IDIE_rdst,rdst,rsrc:in std_logic_vector (2 downto 0);
	IDIE_memread: in std_logic;
	opcode: in std_logic_vector( 4 downto 0);
	PC_rewrite,IFID_rewrite,IDIE_flush: out std_logic
);
end entity hazardunit;


architecture arch of hazardunit is 
CONSTANT  POP  :  std_logic_vector(4 downto 0)  := "01101";
CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
signal actualhazard : std_logic;
begin 

actualhazard<='0' when  opcode=POP or opcode=LDM or opcode=LDD  else
		'1';
PC_rewrite<='1' when (IDIE_rdst=rdst or IDIE_rdst=rsrc) and IDIE_memread='1' and actualhazard='1'  else
		'0';

IFID_rewrite<='1' when (IDIE_rdst=rdst or IDIE_rdst=rsrc) and IDIE_memread='1'and actualhazard='1' else
		'0';

IDIE_flush<='1' when (IDIE_rdst=rdst or IDIE_rdst=rsrc) and IDIE_memread='1'and actualhazard='1' else
		'0';


end arch;
