
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity control is
port(
	opcode : in std_logic_vector (4 downto 0);
	interrupt,Rst: in std_logic;
	ID_flush,Ex_flush,regwrite,memtoreg,memread,memwrite,call,int,outtoport: out std_logic;
	pushpop,ret,getdatafrom:out std_logic_vector (1 downto 0);
	jump:out std_logic_vector (2 downto 0);
	Aluop : out std_logic_vector (4 downto 0)

);
end entity;
architecture arch of control is 
CONSTANT  NOP  :  std_logic_vector(4 downto 0)  := "00000";
CONSTANT  MOV  :  std_logic_vector(4 downto 0)  := "00001";
CONSTANT  ADD  :  std_logic_vector(4 downto 0)  := "00010";--first bit must be 0 and sub is the opposite (also in inc and dec)
CONSTANT  SUB  :  std_logic_vector(4 downto 0)  := "00011";
CONSTANT  myAND  :  std_logic_vector(4 downto 0)  := "00100";
CONSTANT  myOR  :  std_logic_vector(4 downto 0)  := "00101";
CONSTANT  RLC  :  std_logic_vector(4 downto 0)  := "00110";
CONSTANT  RRC  :  std_logic_vector(4 downto 0)  := "00111";
CONSTANT  SHL  :  std_logic_vector(4 downto 0)  := "01000";
CONSTANT  SHR  :  std_logic_vector(4 downto 0)  :=  "01001";
CONSTANT  SETC  :  std_logic_vector(4 downto 0)  := "01010";
CONSTANT  CLC  :  std_logic_vector(4 downto 0)  := "01011";
CONSTANT  PUSH  :  std_logic_vector(4 downto 0)  := "01100";
CONSTANT  POP  :  std_logic_vector(4 downto 0)  := "01101";
CONSTANT  myOUT  :  std_logic_vector(4 downto 0)  := "01110";
CONSTANT  myIN  :  std_logic_vector(4 downto 0)  := "01111";
CONSTANT  myNOT  :  std_logic_vector(4 downto 0)  := "10000";
CONSTANT  NEG :  std_logic_vector(4 downto 0)  := "10001";
CONSTANT  INC :  std_logic_vector(4 downto 0)  := "10010";
CONSTANT  DEC :  std_logic_vector(4 downto 0)  := "10011";
CONSTANT  JZ :  std_logic_vector(4 downto 0)  := "10100";
CONSTANT  JN :  std_logic_vector(4 downto 0)  := "10101";
CONSTANT  JC :  std_logic_vector(4 downto 0)  := "10110";
CONSTANT  JMP :  std_logic_vector(4 downto 0)  := "10111";
CONSTANT  myCALL :  std_logic_vector(4 downto 0)  := "11000";
CONSTANT  myRET :  std_logic_vector(4 downto 0)  := "11001";
CONSTANT  RTI :  std_logic_vector(4 downto 0)  := "11010";
CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
CONSTANT  STD :  std_logic_vector(4 downto 0)  := "11101";
begin

pushpop<="10" when opcode=PUSH or opcode=myCALL or interrupt='1' else --push when op is push,call,int
	"01" when opcode=POP or opcode=myRET or opcode=RTI else --pop when op is pop,ret,reti
	"00" when Rst='1' else
		"00";
regwrite<='1' when Rst='0' and(opcode <= SHR or opcode = POP or (opcode >=myIN and opcode <= DEC) or opcode =LDM or opcode=LDD)  else
			'0';
memtoreg<='1' when (opcode=LDD or opcode=POP )and Rst='0' else '0';--memtoreg when op is load or pop
memread<='1' when (opcode=POP or opcode=LDD or opcode=myRET or opcode=RTI or opcode=LDM) and Rst='0' else '0';--memread when op is pop,ldd,ret,reti
memwrite<='1' when (opcode=STD or interrupt='1' or opcode=myCALL or opcode=PUSH) and RSt='0' else '0';--memwrite when op is std,int,call,push
jump<="100" when opcode=JZ or opcode=JC or opcode=JN else --jz
	"111" when opcode=JMP else--jmp
	"000" when Rst='1' else  --first bit det if its a jump or not the last 2 det which type of jump 
	"000";
ret<="11"when opcode=RTI else-- reti
	"10" when opcode=myRET else--ret
	"01" when Rst='1' else
	 "00" ;
int<='1'when interrupt='1' and Rst='0' else '0';
getdatafrom<="01" when opcode=LDM or opcode=SHL  or opcode=SHR else--op is ldm,shl,shr(use imm value)
		"10" when opcode=myIN else --from input port 
		"11" when Rst='1' else--from alu
		"00";
outtoport<='1' when opcode=myOUT and Rst='0' else '0';
call<='1' when opcode =myCALL and RSt='0' else '0';
Aluop<=opcode;


ID_flush<='0'; --think about it when we need it
Ex_flush<='0';

end arch;
