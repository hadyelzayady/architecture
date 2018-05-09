library ieee;
use ieee.std_logic_1164.all;
entity ForwardUnit is
	port (
		EX_MEM_WB:in std_logic;
		MEM_WB_WB:in std_logic;
		Rsrc: in std_logic_vector(2 downto 0);
		Rdst: in std_logic_vector(2 downto 0);
		EX_Mem_Rdst: in std_logic_vector(2 downto 0);
		Mem_WB_Rdst: in std_logic_vector(2 downto 0);
		Rsrc_choice,Rdst_choice: out std_logic_vector (1 downto 0)
	);
end ForwardUnit;

architecture ForwardUnit_arc of ForwardUnit is
begin
	Rdst_choice<="01" when Rdst=EX_Mem_Rdst and EX_MEM_WB='1' else 
				"10" when Rdst=Mem_WB_Rdst and MEM_WB_WB='1' else
					"00";
	Rsrc_choice<="01" when Rsrc=EX_Mem_Rdst and EX_MEM_WB='1' else 
				"10" when Rsrc=Mem_WB_Rdst and MEM_WB_WB='1' else
					"00";			

end ForwardUnit_arc;