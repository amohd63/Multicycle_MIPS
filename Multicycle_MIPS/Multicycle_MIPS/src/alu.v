module alu(A, B, ALUop, out, zFlag);
input[23:0] A, B;
input[1:0] ALUop;
output reg zFlag;
reg[23:0] tempOut;	 
output reg[23:0] out;

always @(*) begin
    case (ALUop)
        3'b00: tempOut <= A & B;
        3'b01: tempOut <= (A > B) ? A : B;
        3'b10: tempOut <= A + B;
        3'b11: zFlag <= A < B;
    endcase
	zFlag = (| tempOut);
	out <= tempOut;
	
	
end


endmodule