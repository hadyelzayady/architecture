vsim -gui work.alu
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
# Start time: 19:51:42 on Apr 15,2018
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
add wave -position end  sim:/alu/Cout
add wave -position end  sim:/alu/F
add wave -position end  sim:/alu/carry
add wave -position end  sim:/alu/AdderSecOperand
add wave -position end  sim:/alu/sum
add wave -position 6  sim:/alu/Flags
add wave -position end  sim:/alu/overflow2op
add wave -position end  sim:/alu/overflow1op
force -freeze sim:/alu/A 16'h9 0
force -freeze sim:/alu/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/A 16'h0005 0
force -freeze sim:/alu/B 16'h3 0
force -freeze sim:/alu/Op 5'h1 0
# Compile of ALU.vhd was successful.
# Compile of ALU.vhd was successful.
# Compile of ALU.vhd was successful.
# Compile of ALU.vhd was successful.
run
run
force -freeze sim:/alu/Op 5'h00 0
run
force -freeze sim:/alu/Op 5'h2 0
run
force -freeze sim:/alu/Op 5'h4 0
run
run
force -freeze sim:/alu/A 16'hF005 0
run
force -freeze sim:/alu/Op 5'h05 0
run
force -freeze sim:/alu/Op 5'h06 0
# Compile of ALU.vhd was successful.
run
force -freeze sim:/alu/Op 5'h07 0
run
force -freeze sim:/alu/A 3 0
force -freeze sim:/alu/B 5 0
force -freeze sim:/alu/Op 5'h02 0
run
force -freeze sim:/alu/Op 5'h03 0
run
force -freeze sim:/alu/Op 5'h08 0
run
force -freeze sim:/alu/Op 5'h09 0
run
force -freeze sim:/alu/B 16'h0 0
force -freeze sim:/alu/Op 5'h0 0
run
force -freeze sim:/alu/B 16'hffff 0
run