vsim -gui work.op2reg
# vsim 
# Start time: 23:14:42 on Apr 13,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.op2reg(aluc_arc)
# Loading ieee.numeric_std(body)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
add wave -position end  sim:/op2reg/A
add wave -position end  sim:/op2reg/B
add wave -position end  sim:/op2reg/Sel
add wave -position end  sim:/op2reg/Cout
add wave -position end  sim:/op2reg/F
add wave -position end  sim:/op2reg/sum
add wave -position end  sim:/op2reg/carry
force -freeze sim:/op2reg/A 16'h1 0
force -freeze sim:/op2reg/B 16'h2 0
force -freeze sim:/op2reg/Sel 3'h1 0
run
force -freeze sim:/op2reg/Sel 3'h2 0
run
force -freeze sim:/op2reg/Sel 3'h3 0
run
force -freeze sim:/op2reg/Sel 3'h4 0
run
force -freeze sim:/op2reg/Sel 3'h5 0
run