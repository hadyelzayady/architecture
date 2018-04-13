vsim -gui work.addersub16bit
# vsim 
# Start time: 21:40:39 on Apr 13,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.fulladder(fulladder_arch)
add wave -position end  sim:/addersub16bit/A
add wave -position end  sim:/addersub16bit/B
add wave -position end  sim:/addersub16bit/Sel
add wave -position end  sim:/addersub16bit/Cout
add wave -position end  sim:/addersub16bit/F
force -freeze sim:/addersub16bit/A 16'h1 0
force -freeze sim:/addersub16bit/B 16'h2 0
force -freeze sim:/addersub16bit/Sel 4'h0 0

force -freeze sim:/addersub16bit/A 16'h3 0
force -freeze sim:/addersub16bit/B 16'h6 0

force -freeze sim:/addersub16bit/A 16'd65535 0
force -freeze sim:/addersub16bit/B 16'd2 0

force -freeze sim:/addersub16bit/Sel 4'h1 0
force -freeze sim:/addersub16bit/A 16'd65535 0
force -freeze sim:/addersub16bit/B 16'd2 0

force -freeze sim:/addersub16bit/A 16'd6 0
force -freeze sim:/addersub16bit/B 16'd7 0

force -freeze sim:/addersub16bit/A 16'd8 0
force -freeze sim:/addersub16bit/B 16'd1 0