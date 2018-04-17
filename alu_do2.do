vsim -gui work.alu
# vsim 
# Start time: 19:58:14 on Apr 16,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# //  ModelSim PE Student Edition 10.4a Apr  7 2015 
# //
# //  Copyright 1991-2015 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# //  WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
# //  LICENSORS AND IS SUBJECT TO LICENSE TERMS.
# //  THIS DOCUMENT CONTAINS TRADE SECRETS AND COMMERCIAL OR FINANCIAL
# //  INFORMATION THAT ARE PRIVILEGED, CONFIDENTIAL, AND EXEMPT FROM
# //  DISCLOSURE UNDER THE FREEDOM OF INFORMATION ACT, 5 U.S.C. SECTION 552.
# //  FURTHERMORE, THIS INFORMATION IS PROHIBITED FROM DISCLOSURE UNDER
# //  THE TRADE SECRETS ACT, 18 U.S.C. SECTION 1905.
# //
# // NOT FOR CORPORATE OR PRODUCTION USE.
# // THE ModelSim PE Student Edition IS NOT A SUPPORTED PRODUCT.
# // FOR HIGHER EDUCATION PURPOSES ONLY
# //
# vsim -gui 
# Start time: 18:34:10 on Apr 16,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
add wave -position end  sim:/alu/A
add wave -position end  sim:/alu/B
add wave -position end  sim:/alu/Op
add wave -position end  sim:/alu/Clk
add wave -position end  sim:/alu/Cin
add wave -position end  sim:/alu/Flags
add wave -position end  sim:/alu/F
add wave -position end  sim:/alu/carry
add wave -position end  sim:/alu/AdderSecOperand
add wave -position end  sim:/alu/AandB
add wave -position end  sim:/alu/AorB
add wave -position end  sim:/alu/sum
add wave -position end  sim:/alu/shiftleft
add wave -position end  sim:/alu/shiftright
add wave -position end  sim:/alu/Overflow
add wave -position end  sim:/alu/SHL
add wave -position end  sim:/alu/SHR
add wave -position end  sim:/alu/ADD
add wave -position end  sim:/alu/SUB
add wave -position end  sim:/alu/RLC
add wave -position end  sim:/alu/RRC
add wave -position end  sim:/alu/myAND
add wave -position end  sim:/alu/myOR
add wave -position end  sim:/alu/INC
add wave -position end  sim:/alu/DEC
add wave -position end  sim:/alu/SETC
add wave -position end  sim:/alu/CLC
add wave -position end  sim:/alu/Z
add wave -position end  sim:/alu/N
add wave -position end  sim:/alu/C
add wave -position end  sim:/alu/V
force -freeze sim:/alu/A 16'h95 0
noforce sim:/alu/A
force -freeze sim:/alu/A 16'h0095 0
force -freeze sim:/alu/B 16'hf 0
force -freeze sim:/alu/Op 5'h1 0
force -freeze sim:/alu/Clk 1 0, 0 {50 ns} -r 100
run
run
run
force -freeze sim:/alu/B 16'h0010 0
run