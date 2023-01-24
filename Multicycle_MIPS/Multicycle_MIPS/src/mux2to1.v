module mux2to1(in1, in2, s, out);
	input[0:23] in1, in2;
	input s;
	output reg[0:23] out;
	//assign out = (~s & in1) || (s& in2);
	always @(in1, in2, s) begin
		if (s)
			out = in2;
		else
			out = in1;
	end
endmodule