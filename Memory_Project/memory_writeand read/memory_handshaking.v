module mem(clk_i,rst_i,addr_i,wdata_i,rdata_o,wr_rd_en_i,valid_i,ready_o);
parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR_WIDTH=4;
input clk_i,rst_i,wr_rd_en_i,valid_i;
input[WIDTH-1:0]wdata_i;
input[ADDR_WIDTH-1:0]addr_i;
output reg[WIDTH-1:0]rdata_o;
output reg ready_o;
integer i;
reg[WIDTH-1:0]mem[DEPTH-1:0];

always@(posedge clk_i)
	if(rst_i==1)begin
		rdata_o=0;
		for(i=0;i<DEPTH;i=i+1)
			mem[i]=0;
	end
	else begin 
		if(valid_i==1)begin
			ready_o=1;
			if(wr_rd_en_i==1)
				mem[addr_i]=wdata_i;
			else
				rdata_o=mem[addr_i];
		end
	else begin
			ready_o=0;
	end
end
endmodule

