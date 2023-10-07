vlog tb_handshaking.v
vsim tb
add wave -position insertpoint /tb/dut/*
run -all
