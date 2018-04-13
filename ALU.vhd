library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
                Sel : in std_logic_vector(3 downto 0);
                SelPart: in std_logic_vector (1 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity ALU;

architecture ALSU_arc of ALU is

component PartA IS
PORT    (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END component PartA;
component PartB IS
PORT    (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		--Cin: in std_logic;
		--Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END component PartB;
component PartC IS
PORT  (
		A : in std_logic_vector(15 downto  0);
		--B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END component PartC;
component PartD IS
PORT  (
		A : in std_logic_vector(15 downto  0);
		--B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END component PartD;
signal tempA : std_logic_vector(15 downto 0);
signal tempB : std_logic_vector(15 downto 0);
signal tempC : std_logic_vector(15 downto 0);
signal tempD : std_logic_vector(15 downto 0);
signal CA : std_logic;
signal CC : std_logic;
signal CD : std_logic;
begin
				
     LabelA:PartA port map(A,B,Sel,Cin,CA,tempA);		
     LabelB:PartB port map(A,B,Sel,tempB);	
     LabelC:PartC port map(A,Sel,Cin,CC,tempC);	
     LabelD:PartD port map(A,Sel,Cin,CD,tempD);	
              
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
