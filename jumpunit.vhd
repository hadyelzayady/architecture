library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity jumpunit is
port(
	flagin:in std_logic_vector (3 downto 0);
	flagtoreg:out std_logic_vector (15 downto 0);
	opcode: in std_logic_vector (4 downto 0);
	jump: out std_logic
	

);
end entity jumpunit;
architecture arch of jumpunit is
signal Z,N,C,jumpsig : std_logic;

begin
Z<=flagin(0);
N<=flagin(1);
C<=flagin(2);

jump<=jumpsig when opcode="10101"  or	opcode="10110" or opcode="10111"  or opcode="11000" else
	'0';

jumpsig<='1' when opcode="10101" and Z='1'  else --jz
	'1' when opcode="10110"  and N='1' else--jn
	'1' when opcode="10111"  and C='1' else--jc
	'1' when opcode="11000" else--jmp
	'0';


flagtoreg<= "000000000000"&flagin(3 downto 1)&'0' when opcode="10101" and Z='1'  else --jz
	"000000000000"&flagin(3 downto 2)&'0'&flagin(0) when opcode="10110"  and N='1' else--jn
	"000000000000"&flagin(3 )&'0'&flagin(1 downto 0) when opcode="10111"  and C='1' else--jc
	"000000000000"&flagin(3 downto 0 ) when opcode="11000" else--jmp
	"000000000000"&flagin(3 downto 0 );
end arch;

