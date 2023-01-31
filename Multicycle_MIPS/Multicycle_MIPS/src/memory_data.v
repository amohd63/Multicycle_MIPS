module memory_data(out_data, address, in_data, memRd, memWr, clk, reset);
   output reg [23:0] out_data;
   input [23:0] in_data;
   input [23:0] address;
   input memRd, memWr, clk, reset;
   reg [7:0] mem [0:1023]; 
   always @(posedge clk) 
	begin
		if (~reset)
			begin
				out_data = $unsigned(0);
			end
		else
			begin
				if (memWr)
					mem[address+2] = in_data[7:0];
					mem[address+1] = in_data[15:8];
					mem[address] = in_data[23:16];
			    if (memRd)
		            out_data = {mem[address], mem[address+1], mem[address+2]};
			end
   end
endmodule