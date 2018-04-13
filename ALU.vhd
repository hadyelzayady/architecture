library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(3 downto 0);
       	Cin: in std_logic;
       	Clk: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity ALU;

architecture ALSU_arc of ALU is
component Add IS
PORT  (
		A : in std_logic_vector(15 downto  0);
		--B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END component Add;
signal tempA : std_logic_vector(15 downto 0);
signal CD : std_logic;
begin
				
     AddL:Add port map(A,Sel,Cin,CD,tempD);	
  

 process(Clk) IS
 	

 end process             
with SelPart select 
         
F<= tempA when "00",
    tempB when "01",
    tempC when "10",
    tempD when "11",
    tempA when others;   
              
with SelPart select 
         
Cout<= CA when "00",
    CC when "01",
    CC when "10",
    CD when "11",
    CC when others;   


              
				
end ALSU_arc;
