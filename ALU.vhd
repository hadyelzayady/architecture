library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
        OldFlags : in std_logic_vector(3 downto 0);
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
--------------------------------------------------------------------------------
-- instructions opcode
--------------------------------------------------------------------------------

  CONSTANT  NOP  :  std_logic_vector(4 downto 0)  := "00000";
  CONSTANT  MOV  :  std_logic_vector(4 downto 0)  := "00001";
  CONSTANT  ADD  :  std_logic_vector(4 downto 0)  := "00010";--first bit must be 0 and sub is the opposite (also in inc and dec)
  CONSTANT  SUB  :  std_logic_vector(4 downto 0)  := "00011";
  CONSTANT  myAND  :  std_logic_vector(4 downto 0)  := "00100";
  CONSTANT  myOR  :  std_logic_vector(4 downto 0)  := "00101";
  CONSTANT  RLC  :  std_logic_vector(4 downto 0)  := "00110";
  CONSTANT  RRC  :  std_logic_vector(4 downto 0)  := "00111";
  CONSTANT  SHL  :  std_logic_vector(4 downto 0)  := "01000";
  CONSTANT  SHR  :  std_logic_vector(4 downto 0)  :=  "01001";
  CONSTANT  SETC  :  std_logic_vector(4 downto 0)  := "01010";
  CONSTANT  CLC  :  std_logic_vector(4 downto 0)  := "01011";
  CONSTANT  PUSH  :  std_logic_vector(4 downto 0)  := "01100";
  CONSTANT  POP  :  std_logic_vector(4 downto 0)  := "01101";
  CONSTANT  myOUT  :  std_logic_vector(4 downto 0)  := "01110";
  CONSTANT  myIN  :  std_logic_vector(4 downto 0)  := "01111";
  CONSTANT  myNOT  :  std_logic_vector(4 downto 0)  := "10000";
  CONSTANT  NEG :  std_logic_vector(4 downto 0)  := "10001";
  CONSTANT  INC :  std_logic_vector(4 downto 0)  := "10010";
  CONSTANT  DEC :  std_logic_vector(4 downto 0)  := "10011";
  CONSTANT  JZ :  std_logic_vector(4 downto 0)  := "10100";
  CONSTANT  JN :  std_logic_vector(4 downto 0)  := "10101";
  CONSTANT  JC :  std_logic_vector(4 downto 0)  := "10110";
  CONSTANT  JMP :  std_logic_vector(4 downto 0)  := "10111";
  CONSTANT  CALL :  std_logic_vector(4 downto 0)  := "11000";
  CONSTANT  RET :  std_logic_vector(4 downto 0)  := "11001";
  CONSTANT  RTI :  std_logic_vector(4 downto 0)  := "11010";
  CONSTANT  LDM :  std_logic_vector(4 downto 0)  := "11011";
  CONSTANT  LDD :  std_logic_vector(4 downto 0)  := "11100";
  CONSTANT  STD :  std_logic_vector(4 downto 0)  := "11101";
--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------

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
signal nota:std_logic_vector(15 downto 0);
signal nega:std_logic_vector(15 downto 0);
signal alu_out : std_logic_vector(15 downto 0);
signal shiftlefttemp :std_logic_vector(15 downto 0);
signal shiftrighttemp :std_logic_vector(15 downto 0);
begin
	addersubLabel: AdderSub16Bit port map (A,AdderSecOperand,Op(0),carry,Overflow,sum);
    with Op select 
        AdderSecOperand <=  x"0001"    when INC ,--inc (first bit must be 0 as in inc so operation is addition)
                            x"0001"    when DEC,--dec
                            B   when others;
    AandB <= A and B;
    AorB <= A or B;

    shiftlefttemp <=  to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B)-1));
    shiftleft <=  to_stdlogicvector(to_bitvector(shiftlefttemp)  sll 1) when B /=x"0000" else
                  A ;
    shiftrighttemp <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B)-1));
    shiftright <= to_stdlogicvector(to_bitvector(shiftrighttemp) srl 1) when B/= x"0000" else
                  A ;
    rl(15 downto 1) <= A(14 downto 0) ;
    rl(0) <= OldFlags(C);
    rr(14 downto 0) <= A(15 downto 1) ;
    rr(15) <= OldFlags(C);
    nota <= not A;
    nega<=std_logic_vector(unsigned(not A) + 1);

    with Op select 
        alu_out <=      shiftleft when SHL,
                        shiftright when SHR,
                        sum when ADD | SUB | INC | DEC,
                        rl when RLC,
                        rr when RRC,
                        AandB when myAND,
                        AorB when myOR,
                        nota when myNOT,
                        nega when NEG,
                        A when STD | MOV | myOUT,
                        B when LDM,
                        (others => '0') when others;
    with Op select 
        Flags(V downto C) <= Overflow & carry when ADD |SUB | INC | DEC ,
                             (A(15) xor shiftleft(15))& (shiftlefttemp(15)) when SHL,
                             A(15)&(shiftrighttemp(0)) when SHR,
                             (A(15) xor rl(15))& A(15) when RLC,
                             (A(15) xor rr(15))& A(0) when RRC,
                             OldFlags(V) & '1'  when SETC,
                             OldFlags(V) &'0' when CLC,
                             OldFlags(V) & '0' when JC,
                             OldFlags(V downto C) when others;
    with Op select 
        Flags(N) <=  alu_out(15) when SHL | SHR | ADD | SUB|INC|DEC|RLC|RRC | myAND | myOR | myNOT| NEG,
                     '0' when JN,
                     OldFlags(N) when others;

    Flags(Z) <= '1' when alu_out = x"0000"  and (Op= SHL or Op=  SHR or Op=  ADD or Op=  SUB or Op= INC or Op= DEC or Op= RLC or Op= RRC or Op=myAND or Op=  myOR or Op= myNOT or Op=NEG) else
                '0' when  alu_out /=x"0000" and (Op= SHL or Op=  SHR or Op=  ADD or Op=  SUB or Op= INC or Op= DEC or Op= RLC or Op= RRC or Op=myAND or Op=  myOR or Op= myNOT or Op=NEG) else
                '0' when Op=JZ else
                OldFlags(Z);
    F<= alu_out;
end architecture ALU_arch;
