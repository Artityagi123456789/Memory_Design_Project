#compilation
vlog tb_handshaking.v

#elaboration
vsim tb

#add signals to wave
add wave -position insertpoint sim:/tb/*

#simulation
run -all
