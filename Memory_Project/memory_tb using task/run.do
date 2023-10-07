#compilation
vlog tb_handshakings.v

#elaboration
vsim tb

#add signals to wave
add wave -position insertpoint sim:/tb/dut/*

#simulation
run -all
