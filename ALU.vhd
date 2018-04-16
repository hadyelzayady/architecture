library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
       	Clk: in std_logic;
		Cin: in std_logic;
        Flags:out std_logic_vector(3 downto 0);
		F : out std_logic_vector(15 downto 0)
	);
end entity ALU;

architecture ALU_arch of ALU is
Component AdderSub16Bit is  
port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic;
		Cout: out std_logic;
        Overflow:out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END Component;
CONSTANT  SHL  :  std_logic_vector(4 downto 0)  := "00000";
CONSTANT  SHR  :  std_logic_vector(4 downto 0)  := "00001";
CONSTANT  ADD  :  std_logic_vector(4 downto 0)  := "00010";--first bit must be 0 and sub is the opposite (also in inc and dec)
CONSTANT  SUB  :  std_logic_vector(4 downto 0)  := "00011";
CONSTANT  RLC  :  std_logic_vector(4 downto 0)  := "00100";
CONSTANT  RRC  :  std_logic_vector(4 downto 0)  := "00101";
CONSTANT  myAND  :  std_logic_vector(4 downto 0)  := "00110";
CONSTANT  myOR  :  std_logic_vector(4 downto 0)  := "00111";
CONSTANT  INC  :  std_logic_vector(4 downto 0)  := "01000";
CONSTANT  DEC  :  std_logic_vector(4 downto 0)  :=  "01001";
CONSTANT  SETC  :  std_logic_vector(4 downto 0)  := "01010";
CONSTANT  CLC  :  std_logic_vector(4 downto 0)  := "01011";
CONSTANT  Z  :  integer  := 0;
CONSTANT  N  :  integer  := 1;
CONSTANT  C  :  integer  := 2;
CONSTANT  V  :  integer  := 3;
signal carry:std_logic;
signal AdderSecOperand :  std_logic_vector(15 downto  0);
signal AandB :std_logic_vector(15 downto 0);
signal AorB :std_logic_vector(15 downto 0);
signal sum:std_logic_vector(15 downto 0);
signal shiftleft:std_logic_vector(15 downto 0);
signal shiftright:std_logic_vector(15 downto 0);
signal Overflow:std_logic;
signal rr:std_logic_vector(15 downto 0);
signal rl:std_logic_vector(15 downto 0);
begin
	addersubLabel: AdderSub16Bit port map (A,AdderSecOperand,Op(0),carry,Overflow,sum);
    with Op select 
        AdderSecOperand <=  x"0001"    when INC ,--inc (first bit must be 0 as in inc so operation is addition)
                            x"0001"    when DEC,--dec
                            B   when others;
    AandB <= A and B;
    AorB <= A or B;
    shiftleft <=  to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B)));
    shiftright <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B)));
    rl(15 downto 1) <= A(14 downto 0) ;
    rl(0) <= Cin;
    rr(14 downto 0) <= A(15 downto 1) ;
    rr(15) <= Cin;

    alu_process : process( clk )
    begin
    	case(Op) is
    			when SHL =>--shift left 
    				F <= shiftleft;
                    if (shiftleft = x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (shiftleft(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                    if (A(15) /= shiftleft(15)) then
                        Flags(V)<='1';
                    else
                        Flags(V)<='0';
                    end if;
                    if ( B /=x"0000" ) then
                        if (B < x"0011") then
                            Flags(C) <=  A(to_integer(16-unsigned(B)));
                        else
                            Flags(C) <='0';
                        end if;
                    end if;
    			when SHR => --shift right
    				F <=shiftright;
                   
                    if (shiftright = x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (shiftright(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                    if (A(15) ='1' ) then -- as always we insert zero -> if msb is 1 then it will be zero
                         Flags(V)<='1';
                    else
                        Flags(V)<='0';
                    end if;
                    if ( B /=x"0000" ) then
                        if (B < x"0011") then
                            Flags(C) <= A(-1+to_integer(unsigned(B)));
                        else
                            Flags(C) <='0';
                        end if;
                    end if;
                when ADD | SUB | INC | DEC  => --add or sub or inc or dec
                    F <= sum;
                    Flags(C) <=carry;
                    if (sum = x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (sum(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                    Flags(V)<= Overflow;
                when RLC => --rotate left
                    F <= rl ;
                    Flags(C) <=  A(15);
                    if (rl = x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (rl(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                    if (A(15) /= rl(15) ) then -- as always we insert zero -> if msb is 1 then it will be zero
                         Flags(V)<='1';
                    else
                        Flags(V)<='0';
                    end if;
                when RRC => --rotate right
                    F <= rr ;
                    Flags(C) <=  A(0);
                    if (rr = x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (rr(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                    if (A(15) /= rr(15) ) then -- as always we insert zero -> if msb is 1 then it will be zero
                         Flags(V)<='1';
                    else
                        Flags(V)<='0';
                    end if;
                when myAND => --and
                    F <=AandB;
                    if (AandB= x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (AandB(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
                when myOR => --or
                    F <= AorB;
                    if (AorB= x"0000") then
                        Flags(Z) <= '1';
                    else
                        Flags(Z) <= '0';
                    end if;
                    if (AorB(15) = '1') then
                        Flags(N) <='1';
                    else
                        Flags(N) <='0';  
                    end if;
    			when others =>
    				null;
    		end case;	
    end process ; -- alu_process

end architecture ALU_arch;
