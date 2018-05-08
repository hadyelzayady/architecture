 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity fetch_stage is
port(
	Rjump: in std_logic_vector(15 downto 0);-- from input to alu jump C N Z
	Rcallorjump: in std_logic_vector(15 downto 0); --from reg rdst 
	Rret: in std_logic_vector(15 downto 0); -- from function mem/wb ret or reti
	Rint: in std_logic_vector(15 downto 0); -- destination from interrupt
	Rrst: in std_logic_vector(15 downto 0); -- destination from reset
	newsp: in std_logic_vector(15 downto 0); -- new stack pointer updated every cycle  
	Rst,clk,callorjump,jmpCNZ,ret,interrupt:in std_logic;
	Mem_inst: out std_logic_vector(31 downto 0);
	NextPC: out std_logic_vector(15 downto 0);
	SPOutput: out std_logic_vector(15 downto 0)
);
end fetch_stage;

architecture arch of fetch_stage is
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
CONSTANT  RTI :  std_logic_vector(4 downto 0)  := "11010";
CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
CONSTANT  STD :  std_logic_vector(4 downto 0)  := "11101";
component my_nDFF is
Generic ( n : integer := 16);
port( Clk,Rst,enable : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

component syncram2 is
Generic(n:integer:= 16);
port ( clk : in std_logic;
we : in std_logic;
address : in std_logic_vector(n-1 downto 0);
datain : in std_logic_vector(n-1 downto 0);
dataout : out std_logic_vector(2*n-1 downto 0) );
end component;

signal regin,out1,out2,out3,out4: std_logic_vector(15 downto 0);
signal pc,sp: std_logic_vector(15 downto 0):=x"0000";
signal Memout: std_logic_vector(31 downto 0);
signal opcode: std_logic_vector(4 downto 0);
signal one :std_logic_vector(15 downto 0):="0000000000000001";
signal two :std_logic_vector(15 downto 0):="0000000000000010";
signal newPc:std_logic_vector(15 downto 0);

begin 
PCreg: my_nDFF generic map (n => 16) port map(Clk,Rst,'1',regin,pc);
SPreg: my_nDFF generic map (n => 16) port map(Clk,Rst,'1',newsp,sp);
inst_mem:syncram2 generic map (n => 16) port map(Clk,'0',newpc,"0000000000000000",Memout);
opcode <= Memout(31 downto 27);
PC_process : process( Clk,Rst )
begin
	if(Rst ='1') then 
		newPc <= pc;
	elsif(falling_edge(Clk)) then
		if (callorjump ='1') then
			newpc <= Rcallorjump;
		elsif(opcode= SHL or opcode=SHR  or opcode=LDM  or opcode=LDD  or opcode=STD) then
			newPc <= newpc+two;
		else
		 	newPc <= newpc+one;
		end if;
	elsif(rising_edge(Clk)) then
		Mem_inst<=Memout;
	end if;
end process ; -- PC_process
--newPc<= pc when Rst='1' else 
--	pc+two when opcode=SHL or opcode=LDM  or opcode="11110"  or opcode="11101"  or opcode="11100" else
--	pc+one; 


--out1<= newpc when jmpCNZ='0' else  Rjump;
--out2<= out1 when ret='0' else Rret;
--out3<=out2 when Rst='0' else Rrst;
--out4<=out3 when callorjump='0' else Rcallorjump;
--regin<=out4 when interrupt='0' else Rint;  
NextPC<=newpc;
--SPOutput<=sp;
end arch ;
