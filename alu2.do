vsim -gui work.alu
# vsim 
# Start time: 16:43:36 on May 04,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# vsim 
# Start time: 16:36:55 on May 04,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
add wave -position insertpoint  \
sim:/alu/A \
sim:/alu/B \
sim:/alu/Op \
sim:/alu/Cin \
sim:/alu/OldFlags \
sim:/alu/Flags \
sim:/alu/F
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlftk7etrn".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlftk7etrn
# 
force -freeze sim:/alu/A 16'hF0F0 0
force -freeze sim:/alu/B 16'h0F0F 0
force -freeze sim:/alu/Op 5'h0 0
run
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlfttsnrz5".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlfttsnrz5
# 
add wave -position insertpoint  \
sim:/alu/shiftleft \
sim:/alu/shiftright \
sim:/alu/Overflow \
sim:/alu/rr \
sim:/alu/rl \
sim:/alu/nota \
sim:/alu/nega \
sim:/alu/alu_out \
sim:/alu/shiftlefttemp \
sim:/alu/shiftrighttemp \
sim:/alu/SHL \
sim:/alu/SHR \
sim:/alu/ADD \
sim:/alu/SUB \
sim:/alu/RLC \
sim:/alu/RRC \
sim:/alu/myAND \
sim:/alu/myOR \
sim:/alu/INC \
sim:/alu/DEC \
sim:/alu/SETC \
sim:/alu/CLC \
sim:/alu/myNOT \
sim:/alu/NEG \
sim:/alu/STD \
sim:/alu/MOV
run
force -freeze sim:/alu/Op 5'h2 0
force -freeze sim:/alu/Op 5'h02 0
run
force -freeze sim:/alu/Op 5'h03 0
run
force -freeze sim:/alu/Cin 1 0
force -freeze 4sim:/alu/Op 5'h03 0
# Dataset not found: 4sim
force -freeze sim:/alu/Op 5'h04 0
run
add wave -position insertpoint  \
sim:/alu/rr \
sim:/alu/rl