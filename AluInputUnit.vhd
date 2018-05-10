library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AluInputUnit is
	port (
		opcodeoutD: in std_logic_vector(4 downto 0);
		wboutE,wboutM: std_logic;
		rsrcnooutD,rdstnooutD,rdstnooutE,rdstnooutM:in std_logic_vector(2 downto 0);
		rsrcoutD,rdstoutD,aluresultoutE,aluresultoutM,ImmoutD:in std_logic_vector(15 downto 0);
		port1_data,port2_data: out std_logic_vector(15 downto 0)
	);
end AluInputUnit;

architecture AluInputUnit_arc of AluInputUnit is
	component ForwardUnit is
		port (
				EX_MEM_WB:in std_logic;
				MEM_WB_WB:in std_logic;
				Rsrc: in std_logic_vector(2 downto 0);
				Rdst: in std_logic_vector(2 downto 0);
				EX_Mem_Rdst: in std_logic_vector(2 downto 0);
				Mem_WB_Rdst: in std_logic_vector(2 downto 0);
				shift:in std_logic;
				Rsrc_choice,Rdst_choice: out std_logic_vector (1 downto 0)
			);
	end component ForwardUnit;
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
	signal tempport2_data : std_logic_vector(15 downto 0);
	signal port1_choice,port2_choice:std_logic_vector(1 downto 0);
	signal shift : std_logic;
begin
	with opcodeoutD select
		tempport2_data <= ImmoutD when SHL | SHR | LDM  ,
					  rdstoutD when others;

	with port1_choice select
		port1_data <=  aluresultoutE when "01",
					   aluresultoutM when "10",
					   rsrcoutD when others;
	with port2_choice select
		port2_data <=	aluresultoutE when "01",
						aluresultoutM when "10",
						tempport2_data when others;
	shift <= '0' when opcodeoutD = SHR or opcodeoutD=SHR else '1';
	forwardLabel: ForwardUnit port map(wboutE,wboutM,rsrcnooutD,rdstnooutD,rdstnooutE,rdstnooutM,shift,port1_choice,port2_choice);
end AluInputUnit_arc;
