module register_file(Ra, Rb, Rw, enWrite, clk, BusA, BusB, BusW);
input[2:0] Ra, Rb, Rw;
input enWrite, clk;
input[23:0] BusW;
output reg[23:0] BusA, BusB;
reg [23:0] registers[7:0] = '{24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000};
reg Ra_in, Rb_in, Rw_in;

always @(posedge clk) 
	begin
		Ra_in = $unsigned(Ra);
		Rb_in = $unsigned(Rb);
		Rw_in = $unsigned(Rw);
		BusA <= registers[Ra_in];
		BusB <= registers[Rb_in];
		if (enWrite && Rw_in != 0)
			registers[Rw_in] <= BusW;
		if (Rw_in == 0)
			$display ("Tried to overwrite R0, but it's discarded!");
   end
endmodule
