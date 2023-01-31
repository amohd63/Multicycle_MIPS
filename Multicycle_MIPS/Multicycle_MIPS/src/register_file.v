module register_file(Ra, Rb, Rw, enWrite, clk, reset, BusA, BusB, BusW);
input[2:0] Ra, Rb, Rw;
input enWrite, clk, reset;
input[23:0] BusW;
output reg[23:0] BusA, BusB;
reg [23:0] registers[7:0] = '{24'h110000, 24'h000011, 24'h100000, 24'h010000, 24'h001000, 24'h000100, 24'h000010, 24'h000001};
integer Ra_in, Rb_in, Rw_in;

always @(posedge clk or negedge reset)
	begin							  
		if (~reset)
			begin
				BusA = $unsigned(0);
				BusB = $unsigned(0);
			end
		else
			begin
				Ra_in = $unsigned(Ra);
				Rb_in = $unsigned(Rb);
				Rw_in = $unsigned(Rw);
				BusA = registers[Ra_in];
				BusB = registers[Rb_in];
				if (enWrite && Rw_in != 0)
					registers[Rw_in] = BusW;
				if (Rw_in == 0)
					$display ("Tried to overwrite R0, but it's discarded!");
			end
   end
endmodule