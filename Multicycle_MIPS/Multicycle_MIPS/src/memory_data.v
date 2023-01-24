module memory_data(out_data, address, in_data, memRd, memWr, clk);
   output reg [23:0] out_data;
   input [23:0] in_data;
   input [23:0] address;
   input memRd, memWr, clk;
   reg [23:0] mem [1023:0]; 
   always @(posedge clk) 
	begin
		if (memWr)
			mem[address] <= in_data;
	    if (memRd)
            out_data <= mem[address];
   end
endmodule
