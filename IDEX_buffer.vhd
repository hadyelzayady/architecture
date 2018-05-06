


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity IDEX_buffer is
port(
	pcin,spin: in std_logic_vector (15 downto 0);
	Inputportin,Immin,EAin,rsrcin,rdstin: in std_logic_vector (15 downto 0);
	opcodein : in std_logic_vector (4 downto 0);
	rsrcnoin,rdstnoin ,jumpin: in std_logic_vector (2 downto 0);
	pushpopin,getdatafromin,retin : in std_logic_vector (1 downto 0) ;  	
	IDEX_rewrite,IDEX_reset,Clk,wbin,memtoregin,memreadin,memwritein,callin,interruptin,outportin: in std_logic;--wbin is regwrite signal to decode stage
	
	pcout,spout: out std_logic_vector (15 downto 0);
	Inputportout,Immout,EAout,rsrcout,rdstout: out std_logic_vector (15 downto 0);
	opcodeout : out std_logic_vector (4 downto 0);
	rsrcnoout,rdstnoout,jumpout : out std_logic_vector (2 downto 0);
	pushpopout,getdatafromout,retout : out std_logic_vector (1 downto 0) ;  	
	wbout,memtoregout,memreadout,memwriteout,callout,interruptout,outportout: out std_logic--wbin is regwrite signal to decode stage
	

	


);
end IDEX_buffer;

architecture arch of IDEX_buffer is

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


enable <=not(IDEX_rewrite);

PCreg: my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',pcin,pcout);
SPreg: my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',spin,spout);

inputreg:my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',inputportin,Inputportout);
IMMreg:my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',Immin,Immout);
EAreg:my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',EAin,EAout);
Rsrc:my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',rsrcin,rsrcout);
Rdst:my_nDFF3 generic map (n => 16) port map(Clk,IDEX_reset,'1',rdstin,rdstout);

opcodereg : my_nDFF3 generic map (n => 5) port map(Clk,IDEX_reset,'1',opcodein,opcodeout);
rsrcno: my_nDFF3 generic map (n => 3) port map(Clk,IDEX_reset,'1',rsrcnoin,rsrcnoout);
rdstno: my_nDFF3 generic map (n => 3) port map(Clk,IDEX_reset,'1',rdstnoin,rdstnoout);
jump: my_nDFF3 generic map (n => 3) port map(Clk,IDEX_reset,'1',jumpin,jumpout);


pushpop: my_nDFF3 generic map (n => 2) port map(Clk,IDEX_reset,'1',pushpopin,pushpopout);
getdatafrom: my_nDFF3 generic map (n => 2) port map(Clk,IDEX_reset,'1',getdatafromin,getdatafromout);
ret: my_nDFF3 generic map (n => 2) port map(Clk,IDEX_reset,'1',retin,retout);
wb: my_DFF3  port map(Clk,IDEX_reset,'1',wbin,wbout);
memtoreg: my_DFF3  port map(Clk,IDEX_reset,'1',memtoregin,memtoregout);
memread: my_DFF3  port map(Clk,IDEX_reset,'1',memreadin,memreadout);
memwrite: my_DFF3  port map(Clk,IDEX_reset,'1',memwritein,memwriteout);
call: my_DFF3  port map(Clk,IDEX_reset,'1',callin,callout);
interrupt: my_DFF3  port map(Clk,IDEX_reset,'1',interruptin,interruptout);
outport: my_DFF3  port map(Clk,IDEX_reset,'1',outportin,outportout);


end arch;


