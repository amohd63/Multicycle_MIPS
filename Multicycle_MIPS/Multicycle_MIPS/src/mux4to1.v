module mux4_1(in1, in2, in3, in4, s1, s2, out);
input[23:0] in1, in2, in3, in4;
input s1, s2;
output reg[23:0] out;
always @(*) begin
    case ({s2, s1})
        2'b00: out = in1;
        2'b01: out = in2;
        2'b10: out = in3;
        2'b11: out = in4;
    endcase
end

endmodule
