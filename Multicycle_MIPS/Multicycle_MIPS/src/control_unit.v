module control_unit(reset, clk, opcode, condition, zFlag, BEQFlag, RBsrc, RWsrc, RegWR, ALUs, ALUop, MRD, MWR, WB);

input[4:0] opcode;
input[1:0] condition;
input zFlag, BEQFlag, reset, clk;
output reg[1:0] RWsrc, WB;
output reg RBsrc, RegWR, ALUs, MRD, MWR;
output reg[1:0] ALUop;


wire[1:0] RWsrc1, WB1;
wire RBsrc1, RegWR1, ALUsrc1, MRD1, MWR1;
wire[1:0] ALUop1;
reg executed;

wire[1:0] RWsrct, WBt;
wire RBsrct, RegWRt, ALUsrct, MRDt, MWRt;
wire[1:0] ALUopt;

assign WBt[1] = ((~opcode[4]) & opcode[1] & opcode[0]) | ((~opcode[4])&(~opcode[3])) |	((~opcode[4])&(~opcode[2]));
assign WBt[0] = ((~opcode[4]) & (~opcode[2]) & opcode[1] & (~opcode[0])) | ((~opcode[4]) & opcode[3] & (~opcode[1]) & opcode[0]);

assign RWsrct[1] = ((~opcode[4]) & opcode[3] & opcode[2] & (~opcode[1]));
assign RWsrct[0] = ((~opcode[4]) & opcode[3] & opcode[2] & (~opcode[0]));

assign ALUsrct = ((~opcode[4]) & (~opcode[2]) & opcode[1] & opcode[0]) | ((~opcode[4]) & (~opcode[3]) & (~opcode[1])) | ((~opcode[4]) & (~opcode[3]) & (~opcode[0]));

assign MWRt =  ((~opcode[4]) & opcode[3] & (~opcode[2]) & opcode[1] & (~opcode[0]));

assign RBsrct = ((~opcode[4]) & opcode[3]);

assign MRDt = (opcode[4] & opcode[3] & opcode[2] & (~opcode[1]) & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[1] & (~opcode[0]));

assign RegWRt = ((~opcode[4]) & (~opcode[3]) & (~opcode[1]) & (~opcode[0])) | ((~opcode[4]) & opcode[2] & opcode[1] & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[1]) | ((~opcode[4]) & (~opcode[3]) & (~opcode[2])) | ((~opcode[4]) & (~opcode[2]) & (~opcode[1]));

assign ALUopt[1] = ((~opcode[4]) & (~opcode[2]) & opcode[1]) | 
((~opcode[4]) & opcode[2] & (~opcode[0])) | 
((~opcode[4]) & opcode[3]);

assign ALUopt[0] = ((~opcode[4]) & (~opcode[3]) & (~opcode[1]) &  opcode[0]);

assign executed = ((~condition[0]) & (~zFlag)) | ((~condition[1])&zFlag);

bufif1 g1(WB1[1], WBt[1], executed);
bufif1 g2(WB1[1], 0, ~(executed));

bufif1 g3(WB1[0], WBt[0], executed);
bufif1 g4(WB1[0], 0, ~(executed));

bufif1 g5(RWsrc1[1], RWsrct[1], executed);
bufif1 g6(RWsrc1[1], 0, ~(executed));

bufif1 g7(RWsrc1[0], RWsrct[0], executed);
bufif1 g8(RWsrc1[0], 0, ~(executed));

bufif1 g13(ALUop1[1], ALUopt[1], executed);
bufif1 g14(ALUop1[1], 0, ~(executed));

bufif1 g15(ALUop1[0], ALUopt[0], executed);
bufif1 g16(ALUop1[0], 0, ~(executed));

bufif1 g17(ALUsrc1, ALUsrct, executed);
bufif1 g18(ALUsrc1, 0, ~(executed));

bufif1 g19(MWR1, MWRt, executed);
bufif1 g20(MWR1, 0, ~(executed));

bufif1 g21(RBsrc1, RBsrct, executed);
bufif1 g22(RBsrc1, 0, ~(executed));

bufif1 g23(MRD1, MRDt, executed);
bufif1 g24(MRD1, 0, ~(executed)); 

bufif1 g25(RegWR1, RegWRt, executed);
bufif1 g26(RegWR1, 0, ~(executed));

assign ALUs = ALUsrc1;

always @(posedge clk or negedge reset) begin
	if (~reset)
		begin
			RWsrc = $unsigned(0);
			WB = $unsigned(0);
			RBsrc = $unsigned(0);
			RegWR = $unsigned(0);
			//ALUs = $unsigned(0);
			MRD = $unsigned(0);
			MWR = $unsigned(0);
			ALUop = $unsigned(0);
		end
	else
		begin
			$monitor("%b", opcode);
			RWsrc = RWsrc1;
			WB = WB1;
			RBsrc = RBsrc1;
			RegWR = RegWR1;
			//ALUs = ALUsrc1;
			$monitor("%b", ALUs);
			MRD = MRD1;
			MWR = MWR1;
			ALUop = ALUop1;
		end
end

endmodule