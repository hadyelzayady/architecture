
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity control is
port(
	opcode : in std_logic_vector (4 downto 0);
	interrupt: in std_logic;
	ID_flush,Ex_flush,regwrite,memtoreg,memread,memwrite,call,int,outtoport: out std_logic;
	pushpop,ret,getdatafrom:out std_logic_vector (1 downto 0);
	jump:out std_logic_vector (2 downto 0);
	Aluop : out std_logic_vector (4 downto 0)

);
end entity;
architecture arch of control is 

begin
pushpop<="10" when opcode="01101"or opcode="11001" or interrupt='1' else --push when op is push,call,int
	"01" when opcode="01110"or opcode="11010" or opcode="11011"else --pop when op is pop,ret,reti
	"00";
regwrite<='0' when opcode="00000" or (opcode>= "01011" and opcode <="01111" )or (opcode>"10100" and opcode <"11100" )or opcode="11110" else
	'1';
memtoreg<='1' when opcode="11101" or opcode="01110" else '0';--memtoreg when op is load or pop
memread<='1' when opcode="01110" or opcode="11101" or opcode="11010" or opcode="11011" else '0';--memread when op is pop,ldd,ret,reti
memwrite<='1' when opcode="11110" or interrupt='1' or opcode="11001" or opcode="01101" else '0';--memwrite when op is std,int,call,push
jump<="100" when opcode="10101" else --jz
	"101" when opcode="10110" else--jn
	"110" when opcode="10111" else--jc
	"111" when opcode="11000" else--jmp
	"000"; --first bit det if its a jump or not the last 2 det which type of jump 

ret<="11"when opcode="11011" else-- reti
	"10" when opcode="11010" else--ret
	"00";
int<='1'when interrupt='1' else '0';
getdatafrom<="01" when opcode="11100" or opcode="01001"  or opcode="01010" else--op is ldm,shl,shr(use imm value)
		"10" when opcode="10000" else --from input port 
		"00";--from alu
outtoport<='1' when opcode="01111" else '0';
call<='1' when opcode ="11001"else '0';
Aluop<=opcode;


ID_flush<='0'; --think about it when we need it
Ex_flush<='0';

end arch;
