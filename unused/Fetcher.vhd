Library ieee;
Use ieee.std_logic_1164.all;

entity Fetcher is
	port (
		Clk :in std_logic;
		PC:in std_logic_vector(15 downto 0);
		InstCode:out std_logic_vector(15 downto 0)
	);
end Fetcher;

architecture Fetcher_arc of Fetcher is
	component syncram is
		port ( 
	clk : in std_logic;
	we : in std_logic;
	address : in std_logic_vector(9 downto 0);
	datain : in std_logic_vector(15 downto 0);
	dataout : out std_logic_vector(15 downto 0) 
	);
	end component syncram;
begin
	InstMemory: syncram port map(Clk,we=>'0',PC(9 downto 0),datain=>x"0000",dataout=>InstCode);



end Fetcher_arc;