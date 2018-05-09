library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Entity syncram2 is
Generic(n:integer:= 16);
port ( clk : in std_logic;
we : in std_logic;
address : in std_logic_vector(n-1 downto 0);
datain : in std_logic_vector(n-1 downto 0);
dataout : out std_logic_vector(2*n-1 downto 0) );
end entity syncram2;


architecture arch of syncram2 is
type ram_type is array(0 to 2**n-1) of std_logic_vector(n-1 downto 0);
signal ram: ram_type;
signal address2 : std_logic_vector(n-1 downto 0); 
begin 
process(clk)
begin 

if rising_edge(clk) then 
	if (we='1')then
		ram(to_integer(unsigned(address)))<=datain;
	end if;
end if;
end process;
address2<=address+"0000000000000001";
dataout<=ram(to_integer(unsigned(address)))&ram(to_integer(unsigned(address2)));




end arch;