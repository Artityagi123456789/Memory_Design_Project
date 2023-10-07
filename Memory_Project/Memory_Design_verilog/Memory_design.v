module mem(clk_i,rst_i,addr_i,wdata_i,rdata_o,wr_en_i,rd_en_i);
parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR_WIDTH=4;
input clk_i,rst_i;
input[WIDTH-1:0]
input[ADDR_WIDTH-1:0];
output[WIDTH-1:0]rdata_o;

reg[WIDTH-1:0]mem[DEPTH-1:0];

always@(posedge clk_i)
	if(rst_i==1) begin
		rdata_o=0;

		for(i=0;i<DEPTH;i=i+1)
			mem[i]=0;
	end		
    else begin
		if(wr_en_i==1)
			mem[addr_i]==wdata_i;
			if(rd_en_i==1)

			rdata_o=mem[addr_i];
	end
endmodule

		

