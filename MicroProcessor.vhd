library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicroProcessor is
	port (
		Clk : in std_logic;
		PC:in std_logic_vector(15 downto 0);
		Rst:in std_logic;
		InPort:in std_logic_vector(15 downto 0);
		OutPort:out std_logic_vector(15 downto 0)
			);
end MicroProcessor;

architecture MicroProcessor_arc of MicroProcessor is
component syncram is
port 
( 
	clk : in std_logic;
	we : in std_logic;
	address : in std_logic_vector(9 downto 0);
	datain : in std_logic_vector(15 downto 0);
	dataout : out std_logic_vector(15 downto 0) 
);
end component syncram;
component ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
       	Clk: in std_logic;
       	Cin: in std_logic;	
        Flags:out std_logic_vector(3 downto 0);
		F : out std_logic_vector(15 downto 0)
	);
end component ALU;

component my_nDFF is
Generic ( n : integer := 16);
port( Clk,Rst : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

component Decoder is
	port (
		Clk : in std_logic;
		InstCode:in std_logic_vector(15 downto 0);
		port1_data:out std_logic_vector(15 downto 0);
		port2_data:out std_logic_vector(15 downto 0);
		Rst:in std_logic
	);
end component Decoder;
component RegisterFile is
		port (
			w_en : in std_logic ;
	port1_sel:in std_logic_vector(2 downto 0);
	port2_sel:in std_logic_vector(2 downto 0);
	w_sel: in std_logic_vector(2 downto 0);
	clk: in std_logic;
	rst: in std_logic;
	port1_data:out std_logic_vector(15 downto 0);
	port2_data:out std_logic_vector(15 downto 0);
	write_value:in std_logic_vector(15 downto 0)
		);
end component RegisterFile;
component Fetcher is
	port (
		Clk :in std_logic;
		PC:in std_logic_vector(15 downto 0);
		InstCode:out std_logic_vector(15 downto 0)
	);
end component Fetcher;
CONSTANT  SHL  :  std_logic_vector(4 downto 0)  := "00000";
CONSTANT  SHR  :  std_logic_vector(4 downto 0)  := "00001";
CONSTANT  ADD  :  std_logic_vector(4 downto 0)  := "00010";--first bit must be 0 and sub is the opposite (also in inc and dec)
CONSTANT  SUB  :  std_logic_vector(4 downto 0)  := "00011";
CONSTANT  RLC  :  std_logic_vector(4 downto 0)  := "00100";
CONSTANT  RRC  :  std_logic_vector(4 downto 0)  := "00101";
CONSTANT  myAND  :  std_logic_vector(4 downto 0)  := "00110";
CONSTANT  myOR  :  std_logic_vector(4 downto 0)  := "00111";
CONSTANT  INC  :  std_logic_vector(4 downto 0)  := "01000";
CONSTANT  DEC  :  std_logic_vector(4 downto 0)  :=  "01001";
CONSTANT  SETC  :  std_logic_vector(4 downto 0)  := "01010";
CONSTANT  CLC  :  std_logic_vector(4 downto 0)  := "01011";
CONSTANT  myNOT  :  std_logic_vector(4 downto 0)  := "01100";
CONSTANT  NEG  :  std_logic_vector(4 downto 0)  := "01101";
CONSTANT  STD  :  std_logic_vector(4 downto 0)  := "01110";
CONSTANT  MOV  :  std_logic_vector(4 downto 0)  := "01111";
CONSTANT  LDM  :  std_logic_vector(4 downto 0)  := "10000";
CONSTANT  LDD  :  std_logic_vector(4 downto 0)  := "10001";
signal FlagRegisterWe :std_logic; -- temporary shoudl come from controller
signal ExMemBuffWe :std_logic; -- temporary shoudl come from controller
signal Memout :std_logic_vector(15 downto 0); -- temporary shoudl wite to MemWbBuff

signal DXdata: std_logic_vector(39 downto 0); 
signal DXoutput:std_logic_vector(39 downto 0);

signal ExMemBuffData: std_logic_vector(33 downto 0);
signal XMdata: std_logic_vector(33 downto 0); 
signal Opcode: std_logic_vector(4 downto 0);-- decoder
--signal A :std_logic_vector(15 downto 0);--temp should come from register file
--signal B :std_logic_vector(15 downto 0);--temp should come from register file
signal Flags:std_logic_vector(3 downto 0);
signal FlagsOutput:std_logic_vector(3 downto 0);
signal F:std_logic_vector(15 downto 0);
--signal address: std_logic_vector(9 downto 0);--temp ,shoudl come from DEBuffer then writeen in  ExMemBuff(10)
signal InstCode:std_logic_vector(15 downto 0);
signal InstCode2:std_logic_vector(15 downto 0);
signal port1_data:std_logic_vector(15 downto 0);
signal port2_data:std_logic_vector(15 downto 0);

CONSTANT  C  :  integer  := 2;
signal myPC: std_logic_vector(15 downto 0);
signal RegPort2_data:std_logic_vector(15 downto 0);
signal wb_enable : std_logic;
signal wb_sel : std_logic_vector(2 downto 0);
signal wb_data : std_logic_vector(15 downto 0);
signal Rdst : std_logic_vector(2 downto 0);
signal MWout : std_logic_vector(39 downto 0);
signal MWdata : std_logic_vector(39 downto 0);
signal RdstD : std_logic_vector(2 downto 0);
signal OpcodeD : std_logic_vector(4 downto 0);
signal port1_dataD : std_logic_vector(15 downto 0);
signal port2_dataD : std_logic_vector(15 downto 0);
signal OpcodeE	: std_logic_vector(4 downto 0);
signal AluOutputE : std_logic_vector(15 downto 0);
signal RdstE : std_logic_vector(2 downto 0);

--
begin
	-- opcode Rsrc Rdst Imm
	--PC : my_nDFF generic map (n => 16) port map(Clk,Rst,myPC,InstCode2);
	----------------------------------------------------------------------------
	-- Fetch
	----------------------------------------------------------------------------
	
	InstMemory: syncram port map(Clk,we=>'0',address=>PC(9 downto 0),datain=>x"0000",dataout=>InstCode);
	--Fetch: Fetcher port map(Clk,PC,InstCode);
	FDBuff : my_nDFF generic map (n => 16) port map(Clk,Rst,InstCode,InstCode2);
	----------------------------------------------------------------------------
	-- Decode
	----------------------------------------------------------------------------
	Registers: RegisterFile port map (wb_enable,InstCode2(10 downto 8),InstCode2(7 downto 5),wb_sel,Clk,Rst,port1_data,Port2_data,wb_data);
	OpCode <= InstCode2(15 downto 11);
	--with OpCode select
	--	port2_data <= x"00"&InstCode2( 7 downto 0) when SHL | SHR ,-- immediate value
	--					RegPort2_data when others;
						--x"0000" when others;
	with Opcode select  --for wb
		Rdst <= InstCode2(7 downto 5) when  MOV | ADD | SUB | myAND | myOR ,
				InstCode2(10 downto 8) when others;--should specify ops later

	--DXdata<= Rdst--&InstCode2(15 downto 11) & port2_data & port1_data;--opcode & ..
	-- DX Buffer
	DXRdstBuff : my_nDFF generic map (n => 3) port map(Clk,Rst,Rdst,RdstD);
	DXOpCodeBuff : my_nDFF generic map (n => 5) port map(Clk,Rst,Opcode,OpcodeD);
	DXPort1Buff : my_nDFF generic map (n => 16) port map(Clk,Rst,port1_data,port1_dataD);
	DXPort2Buff : my_nDFF generic map (n => 16) port map(Clk,Rst,port2_data,port2_dataD);


	----------------------------------------------------------------------------
	-- Execute
	----------------------------------------------------------------------------
	
	EX : ALU port map (port1_dataD,port2_dataD,OpcodeD,Clk,Flags(C),Flags,F);
	--XMdata <= DXoutput( 39 downto 32)&F&DXoutput(9 downto 0);--opcode & aluoutput & address
	EMOpCodeBuff : my_nDFF generic map (n => 5) port map(Clk,Rst,OpcodeD,OpcodeE);
	EMAluOutBuff : my_nDFF generic map (n => 16) port map(Clk,Rst,F,AluOutputE);
	EMRdstBuff : my_nDFF generic map (n => 3) port map(Clk,Rst,RdstD,RdstE);
	--EMPort2Buff : my_nDFF generic map (n => 16) port map(Clk,Rst,port2_data,port2_dataD);

	FlagRegister : my_nDFF generic map (n => 4) port map(Clk,Rst,Flags,FlagsOutput); 

	----------------------------------------------------------------------------
	-- Memory
	----------------------------------------------------------------------------
	
	--with ExMemBuffData(31  downto 27)select
	--	ExMemBuffData(0) <='1' when STD,
	--		 '0' when others;
	--DataMemory : syncram port map(Clk,we=>ExMemBuffData(0),address=>ExMemBuffData(10 downto 1),datain=>ExMemBuffData(26 downto 11),dataout=>Memout);--original
	--MWdata <= ExMemBuffData(33 downto 31)&ExMemBuffData(30 downto 15)& Opcode & Memout;--rdst & aluresult
	--MWBuff : my_nDFF generic map (n => 40) port map(Clk,Rst,MWdata,MWout);

	----------------------------------------------------------------------------
	-- Write back
	----------------------------------------------------------------------------
	
	--with MWout(20  downto 16) select --opcode
	--	wb_enable <= '1' when MOV | ADD | SUB | myAND | myOR | LDD | LDM | myNOT | NEG | INC | DEC   | SHR,--specify ragne for wb operations
	--				'0' when others;
	--wb_sel<= MWout(39 downto 37);
	--with MWout(20  downto 16) select --opcode 
	--	wb_data <= MWout(15 downto 0) when LDD,-- wb from memory
	--				MWout(36 downto 21) when others;
	with OpcodeE select --opcode
		wb_enable <= '1' when MOV | ADD | SUB | myAND | myOR | myNOT | NEG | INC | DEC,--specify ragne for wb operations
					'0' when others;
	wb_sel<= RdstE;
	wb_data <= AluOutputE;

end MicroProcessor_arc;
	--DataMemory : syncram port map(Clk,ExMemBuffData(0),address,ExMemBuffData(26 downto 11),Memout);
