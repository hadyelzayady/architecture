vsim -gui work.alu
# vsim 
# Start time: 23:22:29 on Apr 16,2018
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
add wave -position end  sim:/alu/rr
add wave -position end  sim:/alu/rl
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
force -freeze sim:/alu/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/alu/A 16'h95 0
force -freeze sim:/alu/B 16'h12 0
force -freeze sim:/alu/Op 5'h4 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Op 5'h05 0
