

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity IFID_buffer is
port(
	pcin,spin: in std_logic_vector (15 downto 0);
	instruction: in std_logic_vector (31 downto 0);
	Inputportin: in std_logic_vector (15 downto 0);
	IFID_rewrite : in std_logic ;  --make enable =0 used in hazard detection unit
	IFID_reset,Clk: in std_logic;
	pcout,Inputportout,spout : out std_logic_vector (15 downto 0);
	EA,Imm : out std_logic_vector (15 downto 0);
	opcode : out std_logic_vector (4 downto 0);
	rsrc,rdst : out std_logic_vector (2 downto 0)

);
end IFID_buffer;

architecture arch of IFID_buffer is

component my_nDFF3 is
Generic ( n : integer := 16);
port( Clk,Rst,enable : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

signal opcodesigin :std_logic_vector (4 downto 0);
signal enable : std_logic;
signal immsigin :std_logic_vector (15 downto 0);
signal EAsigin :std_logic_vector (15 downto 0);
signal reg1sigin,reg2sigin :std_logic_vector (2 downto 0);
--------------------------------------------------------------------------------
-- instructions set
--------------------------------------------------------------------------------
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
	CONSTANT  CALL :  std_logic_vector(4 downto 0)  := "11000";
	CONSTANT  RET :  std_logic_vector(4 downto 0)  := "11001";
	CONSTANT  RTI :  std_logic_vector(4 downto 0)  := "11010";
	CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
	CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
	CONSTANT  STD :  std_logic_vector(4 downto 0)  := "11101";

--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------


signal rdstsig : std_logic_vector(2 downto 0);
begin
enable <=not(IFID_rewrite);
immsigin<=instruction (15 downto 0);
EAsigin<=instruction (15 downto 0);
opcodesigin <=instruction(31 downto 27);
reg1sigin <=instruction(26 downto 24);
reg2sigin <=instruction(23 downto 21);

with opcodesigin select 
	rdstsig <= reg1sigin when RLC | RRC | NEG | INC | DEC | LDM | LDD,
				reg2sigin when  others;

PCreg: my_nDFF3 generic map (n => 16) port map(Clk,IFID_reset,enable,pcin,pcout);
SPreg: my_nDFF3 generic map (n => 16) port map(Clk,IFID_reset,enable,spin,spout);
IMMreg:my_nDFF3 generic map (n => 16) port map(Clk,IFID_reset,enable,immsigin,Imm);
EAreg:my_nDFF3 generic map (n => 16) port map(Clk,IFID_reset,enable,EAsigin,EA);
inputreg:my_nDFF3 generic map (n => 16) port map(Clk,IFID_reset,enable,inputportin,Inputportout);

opcodereg : my_nDFF3 generic map (n => 5) port map(Clk,IFID_reset,enable,opcodesigin,opcode);
reg1: my_nDFF3 generic map (n => 3) port map(Clk,IFID_reset,enable,reg1sigin,rsrc);
reg2: my_nDFF3 generic map (n => 3) port map(Clk,IFID_reset,enable,rdstsig,rdst);


end arch;



