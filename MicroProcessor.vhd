library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicroProcessor is
	port (
		Clk : std_logic;
		InstCode: std_logic_vector(15 downto 0)
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
CONSTANT  STD  :  std_logic_vector(4 downto 0)  := "01110";
signal FlagRegisterWe :std_logic; -- temporary shoudl come from controller
signal ExMemBuffWe :std_logic; -- temporary shoudl come from controller
signal Memout :std_logic_vector(15 downto 0); -- temporary shoudl wite to MemWbBuff
signal ExMemBuffData: std_logic_vector(26 downto 0);
signal Opcode: std_logic_vector(4 downto 0);-- decoder
signal A :std_logic_vector(15 downto 0);--temp should come from register file
signal B :std_logic_vector(15 downto 0);--temp should come from register file
signal Rst:std_logic;--temp ,should come from control
signal Flags:std_logic_vector(3 downto 0);
signal FlagsOutput:std_logic_vector(3 downto 0);
signal F:std_logic_vector(15 downto 0);
signal address: std_logic_vector(9 downto 0);--temp ,shoudl come from DEBuffer then writeen in  ExMemBuff(10)
CONSTANT  C  :  integer  := 2;
begin
	myAlu : ALU port map (A,B,Opcode,Clk,Flags(C),Flags,F);
	ExMemBuff : my_nDFF generic map (n => 16) port map(Clk,Rst,F,ExMemBuffData(26 downto 11));
	FlagRegister : my_nDFF generic map (n => 4) port map(Clk,Rst,Flags,FlagsOutput);
	--DataMemory : syncram port map(Clk,ExMemBuffData(0),ExMemBuffData(10 downto 1),ExMemBuffData(26 downto 11),Memout);--original
	DataMemory : syncram port map(Clk,ExMemBuffData(0),address,ExMemBuffData(26 downto 11),Memout);
	Opcode <= InstCode(4 downto 0);
	with Opcode select
		ExMemBuffData(0) <='1' when STD,
			 '0' when others;
end MicroProcessor_arc;
