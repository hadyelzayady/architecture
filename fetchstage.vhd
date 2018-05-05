 

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
signal pc,sp: std_logic_vector(15 downto 0);
signal Memout: std_logic_vector(31 downto 0);
signal opcode: std_logic_vector(4 downto 0);
signal one :std_logic_vector(15 downto 0):="0000000000000001";
signal two :std_logic_vector(15 downto 0):="0000000000000010";
signal newPc:std_logic_vector(15 downto 0);

begin 
PCreg: my_nDFF generic map (n => 16) port map(Clk,Rst,'1',regin,pc);
SPreg: my_nDFF generic map (n => 16) port map(Clk,Rst,'1',newsp,sp);
inst_mem:syncram2 generic map (n => 16) port map(Clk,'0',pc,"0000000000000000",Memout);
opcode <= Memout(31 downto 27);
newPc<= pc+two when opcode="01001" or opcode="01010"  or opcode="11110"  or opcode="11101"  or opcode="11100" else
	pc+one; 


out1<= newpc when jmpCNZ='0' else  Rjump;
out2<= out1 when ret='0' else Rret;
out3<=out2 when Rst='0' else Rrst;
out4<=out3 when callorjump='0' else Rcallorjump;
regin<=out4 when interrupt='0' else Rint;  
Mem_inst<=Memout;

end arch ;
