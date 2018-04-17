vsim -gui work.microprocessor
# vsim 
# Start time: 23:33:44 on Apr 17,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# Loading work.my_ndff(a_my_ndff)
# Loading work.syncram(syncrama)
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
# Start time: 23:29:09 on Apr 17,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# Loading work.my_ndff(a_my_ndff)
# Loading work.syncram(syncrama)
add wave -position end  sim:/microprocessor/Clk
add wave -position end  sim:/microprocessor/InstCode
add wave -position end  sim:/microprocessor/FlagRegisterWe
add wave -position end  sim:/microprocessor/ExMemBuffWe
add wave -position end  sim:/microprocessor/Memout
add wave -position end  sim:/microprocessor/ExMemBuffData
add wave -position end  sim:/microprocessor/Opcode
add wave -position end  sim:/microprocessor/A
add wave -position end  sim:/microprocessor/B
add wave -position end  sim:/microprocessor/Rst
add wave -position end  sim:/microprocessor/Flags
add wave -position end  sim:/microprocessor/FlagsOutput
add wave -position end  sim:/microprocessor/F
add wave -position end  sim:/microprocessor/address
add wave -position end  sim:/microprocessor/STD
add wave -position end  sim:/microprocessor/C
force -freeze sim:/microprocessor/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/microprocessor/InstCode 16'h000F 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/DataMemory
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/myAlu
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/myAlu
run
force -freeze sim:/microprocessor/address 10'h0 0
run
force -freeze sim:/microprocessor/Rst 0 0
run
force -freeze sim:/microprocessor/A 16'h1234 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 400 ns  Iteration: 1  Instance: /microprocessor/myAlu
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 400 ns  Iteration: 1  Instance: /microprocessor/myAlu
run
run
force -freeze sim:/microprocessor/InstCode 16'h000E 0
run
run
