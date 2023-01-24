module mux2to1(in1, in2, s, out);
	input[23:0] in1, in2;
	input s;
	output reg[23:0] out;
	//assign out = (~s & in1) || (s& in2);
	always @(in1, in2, s) begin
		if (s)
			out = in2;
		else
			out = in1;
	end
endmodule