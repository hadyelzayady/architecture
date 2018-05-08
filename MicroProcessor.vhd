library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity MicroProcessor is
	port (
		Clk : in std_logic;
		--PC:in std_logic_vector(15 downto 0);
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

component fetch_stage is
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
end component fetch_stage;

component IFID_buffer is
	port (
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
end component IFID_buffer;

component IDEX_buffer is
	port(
		pcin,spin: in std_logic_vector (15 downto 0);
		Inputportin,Immin,EAin,rsrcin,rdstin: in std_logic_vector (15 downto 0);
		opcodein : in std_logic_vector (4 downto 0);
		rsrcnoin,rdstnoin,jumpin : in std_logic_vector (2 downto 0);
		pushpopin,getdatafromin,retin : in std_logic_vector (1 downto 0) ;  	
		IDEX_rewrite,IDEX_reset,Clk,wbin,memtoregin,memreadin,memwritein,callin,interruptin,outportin: in std_logic;--wbin is regwrite signal to decode stage
		
		pcout,spout: out std_logic_vector (15 downto 0);
		Inputportout,Immout,EAout,rsrcout,rdstout: out std_logic_vector (15 downto 0);
		opcodeout : out std_logic_vector (4 downto 0);
		rsrcnoout,rdstnoout ,jumpout: out std_logic_vector (2 downto 0);
		pushpopout,getdatafromout,retout : out std_logic_vector (1 downto 0) ;  	
		wbout,memtoregout,memreadout,memwriteout,callout,interruptout,outportout: out std_logic--wbin is regwrite signal to decode stage
	);
end component IDEX_buffer;

component ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
        OldFlags : in std_logic_vector(3 downto 0);
        Flags:out std_logic_vector(3 downto 0);
		F : out std_logic_vector(15 downto 0)
	);
end component ALU;
component AluInputUnit is
	port (
		opcodeoutD: in std_logic_vector(4 downto 0);
		wboutE,wboutM: std_logic;
		rsrcnooutD,rdstnooutD,rdstnooutE,rdstnooutM:in std_logic_vector(2 downto 0);
		rsrcoutD,rdstoutD,aluresultoutE,aluresultoutM,ImmoutD:in std_logic_vector(15 downto 0);
		port1_data,port2_data: out std_logic_vector(15 downto 0)
	);
end component AluInputUnit;

component EXMEM_buffer is
port(
	pcin,spin,aluresultin: in std_logic_vector (15 downto 0);
	Inputportin,Immin,EAin,rsrcin,rdstin: in std_logic_vector (15 downto 0);
	opcodein : in std_logic_vector (4 downto 0);
	flagin : in std_logic_vector (3 downto 0);
	rsrcnoin,rdstnoin ,jumpin: in std_logic_vector (2 downto 0);
	pushpopin,getdatafromin,retin : in std_logic_vector (1 downto 0) ;  	
	EXMEM_rewrite,EXMEM_reset,Clk,wbin,memtoregin,memreadin,memwritein,callin,interruptin,outportin: in std_logic;--wbin is regwrite signal to decode stage
	
	pcout,spout,aluresultout: out std_logic_vector (15 downto 0);
	Inputportout,Immout,EAout,rsrcout,rdstout: out std_logic_vector (15 downto 0);
	opcodeout : out std_logic_vector (4 downto 0);
	flagout : out std_logic_vector (3 downto 0);	
	rsrcnoout,rdstnoout ,jumpout: out std_logic_vector (2 downto 0);
	pushpopout,getdatafromout,retout : out std_logic_vector (1 downto 0) ;  	
	wbout,memtoregout,memreadout,memwriteout,callout,interruptout,outportout: out std_logic--wbin is regwrite signal to decode stage
);
end component;

component MEMWB_buffer is
	port(
		pcin,spin,aluresultin,memdatain: in std_logic_vector (15 downto 0);
		Inputportin,Immin,EAin,rsrcin,rdstin: in std_logic_vector (15 downto 0);
		opcodein : in std_logic_vector (4 downto 0);
		flagin : in std_logic_vector (3 downto 0);
		rsrcnoin,rdstnoin ,jumpin: in std_logic_vector (2 downto 0);
		pushpopin,getdatafromin,retin : in std_logic_vector (1 downto 0) ;  	
		EXMEM_rewrite,EXMEM_reset,Clk,wbin,memtoregin,memreadin,memwritein,callin,interruptin,outportin: in std_logic;--wbin is regwrite signal to decode stage
		
		pcout,spout,aluresultout,memdataout: out std_logic_vector (15 downto 0);
		Inputportout,Immout,EAout,rsrcout,rdstout: out std_logic_vector (15 downto 0);
		opcodeout : out std_logic_vector (4 downto 0);
		flagout : out std_logic_vector (3 downto 0);	
		rsrcnoout,rdstnoout,jumpout : out std_logic_vector (2 downto 0);
		pushpopout,getdatafromout,retout : out std_logic_vector (1 downto 0) ;  	
		wbout,memtoregout,memreadout,memwriteout,callout,interruptout,outportout: out std_logic--wbin is regwrite signal to decode stage
		);
end component MEMWB_buffer;

component control is
	port(
		opcode : in std_logic_vector (4 downto 0);
		interrupt,Rst: in std_logic;
		ID_flush,Ex_flush,regwrite,memtoreg,memread,memwrite,call,int,outtoport: out std_logic;
		pushpop,ret,getdatafrom:out std_logic_vector (1 downto 0);
		jump:out std_logic_vector (2 downto 0);
		Aluop : out std_logic_vector (4 downto 0)
	);
end component control;

component hazardunit is
	port(
	IDIE_rdst,rdst,rsrc:in std_logic_vector (2 downto 0);
	IDIE_memread: in std_logic;
	PC_rewrite,IFID_rewrite,IDIE_flush: out std_logic
);
end component hazardunit;

component jumpunit is
port(
	flagin:in std_logic_vector (3 downto 0);
	flagtoreg:out std_logic_vector (15 downto 0);
	opcode: in std_logic_vector (4 downto 0);
	jump: out std_logic
);
end component jumpunit;

component pushpopunit is
port(
	EXMEM_SP,MEMWB_SP:in std_logic_vector (15 downto 0);
	EXMEM_pushpop,MEMWB_pushpop:in std_logic_vector(3 downto 0); --from control unit push=10 pop =01 
	sp_tomemwb,sp:out std_logic_vector (15 downto 0)
);
end component pushpopunit;

component my_nDFF is
	Generic ( n : integer := 16);
	port( Clk,Rst,enable : in std_logic;
	d : in std_logic_vector(n-1 downto 0);
	q : out std_logic_vector(n-1 downto 0));
end component;
component my_nDFF3 is
Generic ( n : integer := 16);
port( Clk,Rst,enable : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;
component my_DFF3 is
port( clk,rst, enable,d: in std_logic;
q : out std_logic);
end component;

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

--instructions
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
	--CONSTANT  CALL :  std_logic_vector(4 downto 0)  := "11000";
	--CONSTANT  RET :  std_logic_vector(4 downto 0)  := "11001";
	CONSTANT  RTI :  std_logic_vector(4 downto 0)  := "11010";
	CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
	CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
	CONSTANT  STD :  std_logic_vector(4 downto 0)  := "11101";
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
	signal InstCode:std_logic_vector(31 downto 0);
	signal InstCode2:std_logic_vector(31 downto 0);
	signal port1_data:std_logic_vector(15 downto 0);
	signal port2_data:std_logic_vector(15 downto 0);

	CONSTANT  C  :  integer  := 2;
	signal newPC: std_logic_vector(15 downto 0);
	signal RegPort2_data:std_logic_vector(15 downto 0);
	signal wb_enable : std_logic;
	signal wb_sel : std_logic_vector(2 downto 0);
	signal wb_data : std_logic_vector(15 downto 0);
	signal Rdstno : std_logic_vector(2 downto 0);
	signal rsrcno: std_logic_vector(2 downto 0);
	signal MWout : std_logic_vector(39 downto 0);
	signal MWdata : std_logic_vector(39 downto 0);
	signal RdstD : std_logic_vector(2 downto 0);
	signal OpcodeD : std_logic_vector(4 downto 0);
	signal port1_dataD : std_logic_vector(15 downto 0);
	signal port2_dataD : std_logic_vector(15 downto 0);
	signal port2_dataE : std_logic_vector(15 downto 0);
	signal OpcodeE	: std_logic_vector(4 downto 0);
	signal OpcodeM	: std_logic_vector(4 downto 0);
	signal AluOutputE : std_logic_vector(15 downto 0);
	signal AluOutputM : std_logic_vector(15 downto 0);
	signal RdstE : std_logic_vector(2 downto 0);
	signal RdstM : std_logic_vector(2 downto 0);
	signal Mem_we: std_logic;
	signal PC: std_logic_vector(15 downto 0);
	signal Imm: std_logic_vector(15 downto 0);
	signal ImmD: std_logic_vector(15 downto 0);
	signal NewFlags: std_logic_vector(3 downto 0);
	--------------------------------------------------------------------------------
	-- Magdy
	--------------------------------------------------------------------------------

	signal Rjump :std_logic_vector(15 downto 0);
	signal Rcallorjump : std_logic_vector(15 downto 0 );
	signal Rret : std_logic_vector(15 downto 0 );
	signal Rint : std_logic_vector(15 downto 0 );
	signal Rrst : std_logic_vector(15 downto 0 );
	signal newsp : std_logic_vector(15 downto 0 );
	signal callorjump : std_logic;
	signal jmpCNZ : std_logic:='0';
	signal ret_mem_wb : std_logic;
	signal interrupt : std_logic;
	signal EA : std_logic_vector(15 downto 0);
	signal rsrc : std_logic_vector(15 downto 0);
	signal rdst : std_logic_vector(15 downto 0);
	signal Mem_inst : std_logic_vector(31 downto 0);
	signal NextPC : std_logic_vector(15 downto 0);
	signal SPOutput : std_logic_vector(15 downto 0);
	signal pcin,spin : std_logic_vector(15 downto 0);
	signal IFID_rewrite,IFID_reset : std_logic;
	signal pcout : std_logic_vector(15 downto 0);
	signal Inputportout : std_logic_vector(15 downto 0);
	signal spout : std_logic_vector(15 downto 0);
	signal ID_flush : std_logic;
	signal Ex_flush : std_logic;
	signal regwrite : std_logic;
	signal memtoreg : std_logic;
	signal memread : std_logic;
	signal memwrite : std_logic;
	signal call : std_logic;
	signal int : std_logic;
	signal outtoport : std_logic;
	signal pushpop : std_logic_vector(1 downto 0);
	signal ret : std_logic_vector(1 downto 0);
	signal getdatafrom : std_logic_vector(1 downto 0);
	signal jump : std_logic_vector(2 downto 0);
	signal Aluop : std_logic_vector(4 downto 0);


	signal IDEX_rewriteD,IDEX_resetD : std_logic;
	signal pcoutD,spoutD : std_logic_vector(15 downto 0);
	signal InputportoutD,ImmoutD,EAoutD,rsrcoutD,rdstoutD : std_logic_vector(15 downto 0);
	signal opcodeoutD : std_logic_vector(4 downto 0);
	signal rsrcnooutD,rdstnooutD,jumpoutD : std_logic_vector(2 downto 0);
	signal pushpopoutD,getdatafromoutD,retoutD : std_logic_vector(1 downto 0);
	signal wboutD,memtoregoutD,memreadoutD,memwriteoutD,calloutD,interruptoutD,outportoutD : std_logic;


	signal aluresultinE : std_logic_vector(15 downto 0);
	signal IDEX_rewriteE,IDEX_resetE: std_logic;
	signal pcoutE,spoutE,aluresultoutE : std_logic_vector(15 downto 0);
	signal InputportoutE,ImmoutE,EAoutE,rsrcoutE,rdstoutE : std_logic_vector(15 downto 0);
	signal opcodeoutE : std_logic_vector(4 downto 0);
	signal flagoutE : std_logic_vector(3 downto 0);
	signal rsrcnooutE,rdstnooutE,jumpoutE : std_logic_vector(2 downto 0);
	signal pushpopoutE,getdatafromoutE,retoutE : std_logic_vector(1 downto 0);
	signal wboutE,memtoregoutE,memreadoutE,memwriteoutE,calloutE,interruptoutE,outportoutE : std_logic;

	signal aluresultoutM,memdataoutM : std_logic_vector(15 downto 0);
	signal IDEX_rewriteM,IDEX_resetM: std_logic;
	signal pcoutM,spoutM : std_logic_vector(15 downto 0);
	signal InputportoutM,ImmoutM,EAoutM,rsrcoutM,rdstoutM : std_logic_vector(15 downto 0);
	signal opcodeoutM : std_logic_vector(4 downto 0);
	signal flagoutM : std_logic_vector(3 downto 0);
	signal rsrcnooutM,rdstnooutM,jumpoutM : std_logic_vector(2 downto 0);
	signal pushpopoutM,getdatafromoutM,retoutM : std_logic_vector(1 downto 0);
	signal wboutM,memtoregoutM,memreadoutM,memwriteoutM,calloutM,interruptoutM,outportoutM : std_logic;
	signal tempport2_data : std_logic_vector(15 downto 0);
	signal port1_choice : std_logic_vector(1 downto 0);
	signal port2_choice : std_logic_vector(1 downto 0);

--------------------------------------------------------------------------------
-- end magdy
--------------------------------------------------------------------------------

--
begin
	----------------------------------------------------------------------------
	-- Fetch
	----------------------------------------------------------------------------      call or jump ,jmpcnz,ret_mem_wb,interrupt
	--callorjump<='1' when call='1' or jump="111" else '0';
	IFID_reset<='1' when Rst='1' else '0'  ;
	IDEX_resetD<='1' when Rst='1' else '0';
	IDEX_resetE<='1' when Rst='1' else '0'  ;
	IDEX_resetM<='1' when Rst='1' else '0'  ;
	
	fetchstageLabel : fetch_stage port map(Rjump,Rcallorjump,Rret,Rint,Rrst,newsp,Rst,clk,callorjump,jmpcnz,'0',interrupt,Mem_inst,NextPC,SPOutput);
	IFID: IFID_buffer port map(NextPC,SPOutput,Mem_inst,InPort,IFID_rewrite,IFID_reset,Clk,pcout,Inputportout,spout,EA,Imm,opcode,rsrcno,rdstno);
	
	----------------------------------------------------------------------------
	-- Decode
	----------------------------------------------------------------------------

	Registers: RegisterFile port map (wboutM,rsrcno,rdstno,rdstnooutM,Clk,Rst,port1_dataD,Port2_dataD,wb_data);
	--callorjump <= '1' when "111",
	--			  '0' when others;
	-- change '0' to interrupt signal 
	controlunit: control port map(opcode,'0',Rst,ID_flush,Ex_flush,regwrite,memtoreg,memread,memwrite,call,int,outtoport,pushpop,ret,getdatafrom,jump,Aluop);
	
	-- Out instrcution should be her but we should handle hazard first as mov then out will out old value
	--with Opcode select 
	--	OutPort <= port1_data when myOUT,
	--			   (others => '0') when others;
	
	ID_EXLabel: IDEX_buffer port map (pcout,spout,Inputportout,Imm,EA,port1_dataD,port2_dataD,opcode,rsrcno,rdstno,jump,pushpop,getdatafrom,ret,IDEX_rewriteD,'0',Clk,regwrite,memtoreg,memread,memwrite,call,int,outtoport,pcoutD,spoutD,InputportoutD,ImmoutD,EAoutD,rsrcoutD,rdstoutD,opcodeoutD,rsrcnooutD,rdstnooutD,jumpoutD,pushpopoutD,getdatafromoutD,retoutD,wboutD,memtoregoutD,memreadoutD,memwriteoutD,calloutD,interruptoutD,outportoutD);----------------------------------------------------------------------------
	
	----------------------------------------------------------------------------
	-- Execute
	----------------------------------------------------------------------------
		with jumpoutD select
		callorjump <= '1' when "111",
					  '0' when others;
		Rcallorjump <= port1_data;
	--Rcallorjump <= port1_data ; --what if there is data hazard we should check for that
	AluInputUnitLabel: AluInputUnit port map (opcodeoutD,wboutE,wboutM,rsrcnooutD,rdstnooutD,rdstnooutE,rdstnooutM,rsrcoutD,rdstoutD,aluresultoutE,aluresultoutM,ImmoutD,port1_data,port2_data);

	EX : ALU port map (port1_data,port2_data,OpcodeoutD,FlagsOutput,NewFlags,aluresultinE);
	FlagRegister : my_nDFF generic map (n => 4) port map(Clk,Rst,'1',NewFlags,FlagsOutput); 
	
	-----*******************************************************
    ----*************************************
	-------------VIPPPPP abdo change flagoutput  and put jump unit 
	Ex_MEMLabel: EXMEM_buffer port map(pcoutD,spoutD,aluresultinE
			,InputportoutD,ImmoutD,EAoutD,rsrcoutD,rdstoutD
			,opcodeoutD 
			,FlagsOutput
			,rsrcnooutD,rdstnooutD,jumpoutD
			,pushpopoutD,getdatafromoutD,retoutD
			,IDEX_rewriteE,IDEX_resetE,Clk,wboutD,memtoregoutD,memreadoutD,memwriteoutD,calloutD,interruptoutD,outportoutD
			,pcoutE,spoutE,aluresultoutE
			,InputportoutE,ImmoutE,EAoutE,rsrcoutE,rdstoutE
			,opcodeoutE
			,flagoutE
			,rsrcnooutE,rdstnooutE,jumpoutE
			,pushpopoutE,getdatafromoutE,retoutE
			,wboutE,memtoregoutE,memreadoutE,memwriteoutE,calloutE,interruptoutE,outportoutE);

	----------------------------------------------------------------------------
	-- Memory
	----------------------------------------------------------------------------
	
	DataMemory : syncram port map(Clk,we=>memwriteoutE,address=>ImmoutE(9 downto 0),datain=>aluresultoutE,dataout=>Memout);--original
	
	MEM_WBLabel: MEMWB_buffer port map(pcoutE,spoutE,aluresultoutE,Memout
			,InputportoutE,ImmoutE,EAoutE,rsrcoutE,rdstoutE
			,opcodeoutE
			,flagoutE
			,rsrcnooutE,rdstnooutE,jumpoutE
			,pushpopoutE,getdatafromoutE,retoutE
			,IDEX_rewriteM,IDEX_resetM,Clk,wboutE,memtoregoutE,memreadoutE,memwriteoutE,calloutE,interruptoutE,outportoutE
			,pcoutM,spoutM,aluresultoutM,memdataoutM
			,InputportoutM,ImmoutM,EAoutM,rsrcoutM,rdstoutM
			,opcodeoutM
			,flagoutM
			,rsrcnooutM,rdstnooutM,jumpoutM
			,pushpopoutM,getdatafromoutM,retoutM
			,wboutM,memtoregoutM,memreadoutM,memwriteoutM,calloutM,interruptoutM,outportoutM);
	----------------------------------------------------------------------------
	-- Write back
	----------------------------------------------------------------------------
	with opcodeoutM select 
		wb_data <= memdataoutM when LDD ,
				   inputportoutM when myIN,
				   aluresultoutM when others;
	outputport_process : process( Clk )
	begin
		if(outportoutM='1') then
			OutPort <= aluresultoutM;
		end if;
	end process ; -- outputport_process

end MicroProcessor_arc;
