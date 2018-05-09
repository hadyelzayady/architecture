
Library ieee;
Use ieee.std_logic_1164.all;
Entity FullAdder is      
 port( 
 	a,b,cin : in std_logic;
 	s,cout : out std_logic
 	);
end FullAdder;
Architecture FullAdder_arch of FullAdder is
begin
s <= a xor b xor cin; 
cout <= (a and b) or (cin and (a xor b));

end FullAdder_arch;
