library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity EXMEM_buffer is
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
	rsrcnoout,rdstnoout,jumpout : out std_logic_vector (2 downto 0);
	pushpopout,getdatafromout,retout : out std_logic_vector (1 downto 0) ;  	
	wbout,memtoregout,memreadout,memwriteout,callout,interruptout,outportout: out std_logic--wbin is regwrite signal to decode stage
	

	


);
end EXMEM_buffer;

architecture arch of EXMEM_buffer is

component my_DFF3 is
port( clk,rst, enable,d: in std_logic;
q : out std_logic);
end component;

component my_nDFF3 is
Generic ( n : integer := 16);
port( Clk,Rst,enable : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

signal enable : std_logic;

begin


enable <=not(EXMEM_rewrite);

PCreg: my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,pcin,pcout);
SPreg: my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,spin,spout);
aluresult: my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,aluresultin,aluresultout);

inputreg:my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,inputportin,Inputportout);
IMMreg:my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,Immin,Immout);
EAreg:my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,EAin,EAout);
Rsrc:my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,rsrcin,rsrcout);
Rdst:my_nDFF3 generic map (n => 16) port map(Clk,EXMEM_reset,enable,rdstin,rdstout);

opcodereg : my_nDFF3 generic map (n => 5) port map(Clk,EXMEM_reset,enable,opcodein,opcodeout);
flag : my_nDFF3 generic map (n => 4) port map(Clk,EXMEM_reset,enable,flagin,flagout);

rsrcno: my_nDFF3 generic map (n => 3) port map(Clk,EXMEM_reset,enable,rsrcnoin,rsrcnoout);
rdstno: my_nDFF3 generic map (n => 3) port map(Clk,EXMEM_reset,enable,rdstnoin,rdstnoout);
jump: my_nDFF3 generic map (n => 3) port map(Clk,EXMEM_reset,enable,jumpin,jumpout);


pushpop: my_nDFF3 generic map (n => 2) port map(Clk,EXMEM_reset,enable,pushpopin,pushpopout);
getdatafrom: my_nDFF3 generic map (n => 2) port map(Clk,EXMEM_reset,enable,getdatafromin,getdatafromout);
ret: my_nDFF3 generic map (n => 2) port map(Clk,EXMEM_reset,enable,retin,retout);
wb: my_DFF3  port map(Clk,EXMEM_reset,enable,wbin,wbout);
memtoreg: my_DFF3  port map(Clk,EXMEM_reset,enable,memtoregin,memtoregout);
memread: my_DFF3  port map(Clk,EXMEM_reset,enable,memreadin,memreadout);
memwrite: my_DFF3  port map(Clk,EXMEM_reset,enable,memwritein,memwriteout);
call: my_DFF3  port map(Clk,EXMEM_reset,enable,callin,callout);
interrupt: my_DFF3  port map(Clk,EXMEM_reset,enable,interruptin,interruptout);
outport: my_DFF3  port map(Clk,EXMEM_reset,enable,outportin,outportout);


end arch;

