`include "memory_handshaking.v"
module tb;
parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR_WIDTH=4;
reg clk_i,rst_i,wr_rd_en_i,valid_i;
reg[WIDTH-1:0]wdata_i;
reg[ADDR_WIDTH-1:0]addr_i;
wire[WIDTH-1:0]rdata_o;
wire ready_o;
integer i;
mem dut(clk_i,rst_i,addr_i,wdata_i,rdata_o,wr_rd_en_i,valid_i,ready_o);

always #5 clk_i =~clk_i;
initial begin
	clk_i=0;
	rst_i=1;
	#20;
	rst_i=0;
	for(i=0; i<DEPTH; i=i+1) begin
	@(posedge clk_i);
	addr_i=i;
	wdata_i=$random;
	wr_rd_en_i=1;
	valid_i=1;
end	
	@(posedge clk_i);
	addr_i=0;
	wr_rd_en_i=0;
	valid_i=0;
	wdata_i=0;
#100;
$finish;
end
endmodule
