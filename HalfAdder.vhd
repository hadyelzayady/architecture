
Library ieee;
Use ieee.std_logic_1164.all;
Entity HalfAdder is      
 port( 
 	a,b : in std_logic;
 	s,cout : out std_logic
 	);
end HalfAdder;
Architecture HalfAdder_arch of HalfAdder is
begin
s <= a xor b; 
cout <= (a and b);

end HalfAdder_arch;

