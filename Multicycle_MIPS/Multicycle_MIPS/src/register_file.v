module register_file(Ra, Rb, Rw, enWrite, clk, BusA, BusB, BusW);
input[2:0] Ra, Rb, Rw;
input enWrite, clk;
input[23:0] BusW;
output reg[23:0] BusA, BusB;
reg [23:0] registers[7:0];
reg Ra_in, Rb_in, Rw_in;

always @(posedge clk) 
	begin
		Ra_in = $unsigned(Ra);
		Rb_in = $unsigned(Rb);
		Rw_in = $unsigned(Rw);
		BusA <= registers[Ra_in];
		BusB <= registers[Rb_in];
		if (enWrite)
			registers[Rw_in] <= BusW;
   end
endmodule
