library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity syncram is

generic (address_width : integer:=6);
port 
( 
	clk : in std_logic;
	we : in std_logic;
	address : in std_logic_vector(address_width-1 downto 0);
	datain : in std_logic_vector(7 downto 0);
	dataout : out std_logic_vector(7 downto 0) 
);
end entity syncram;

architecture syncrama of syncram is

type ram_type is array (0 to (2**address_width)-1) of std_logic_vector(7 downto 0);
signal ram : ram_type;

begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram(to_integer(unsigned(address))) <= datain;
			end if;
		end if;
	end process;
	dataout <= ram(to_integer(unsigned(address)));
end architecture syncrama;



