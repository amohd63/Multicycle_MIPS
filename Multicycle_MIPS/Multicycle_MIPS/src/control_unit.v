module control_unit(opcode, condition, zFlag, BEQFlag, PCsrc, RBsrc, RWsrc, RegWR, ALUsrc, ALUop, MRD, MWR, WB);

input[4:0] opcode;
input[1:0] condition;
input zFlag, BEQFlag;
output[1:0] PCsrc, RWsrc, WB;
output RBsrc, RegWR, ALUsrc, MRD, MWR;
output[1:0] ALUop;
reg executed;

wire[1:0] PCsrct, RWsrct, WBt;
wire RBsrct, RegWRt, ALUsrct, MRDt, MWRt;
wire[1:0] ALUopt;

assign WBt[1] = ((~opcode[4]) & opcode[1] & opcode[0]) | ((~opcode[4])&(~opcode[3])) |	((~opcode[4])&(~opcode[2]));
assign WBt[0] = ((~opcode[4]) & (~opcode[2]) & opcode[1] & (~opcode[0])) | ((~opcode[4]) & opcode[3] & (~opcode[1]) & opcode[0]);

assign RWsrct[1] = ((~opcode[4]) & opcode[3] & opcode[2] & (~opcode[1]));
assign RWsrct[0] = ((~opcode[4]) & opcode[3] & opcode[2] & (~opcode[0]));

assign PCsrct[1] = ((~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1] & (~opcode[0])) | ((~opcode[4]) & opcode[3] & (~opcode[2]) & opcode[1] & opcode[0] & BEQFlag);
assign PCsrct[0] = ((~opcode[4]) & opcode[3] & (~opcode[2]) & opcode[1] & opcode[0] & (~BEQFlag)) | ((~opcode[4]) & opcode[3] & opcode[2] & (~opcode[1]));

assign ALUsrct = ((~opcode[4]) & (~opcode[2]) & opcode[1] & opcode[0]) | ((~opcode[4]) & (~opcode[3]) & (~opcode[1])) | ((~opcode[4]) & (~opcode[3]) & (~opcode[0]));

assign MWRt =  ((~opcode[4]) & opcode[3] & (~opcode[2]) & opcode[1] & (~opcode[0]));

assign RBsrct = ((~opcode[4]) & opcode[3]);

assign MRDt = (opcode[4] & opcode[3] & opcode[2] & (~opcode[1]) & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[1] & (~opcode[0]));

assign RegWRt = ((~opcode[4]) & (~opcode[3]) & (~opcode[1]) & (~opcode[0])) | ((~opcode[4]) & opcode[2] & opcode[1] & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[2] & opcode[1]) | ((~opcode[4]) & (~opcode[3]) & (~opcode[2])) | ((~opcode[4]) & (~opcode[2]) & (~opcode[1]));

//assign ALUop[2] = ((~opcode[4]) & opcode[2] & (~opcode[1]) & opcode[0]);
//
//assign ALUop[1] = ((~opcode[4]) & (~opcode[2]) & opcode[1]) | 
//((~opcode[4]) & opcode[2] & (~opcode[0])) | 
//((~opcode[4]) & opcode[3]);
//
//assign ALUop[0] = ((~opcode[4]) & (~opcode[3]) & (~opcode[2]) & (~opcode[1]) & opcode[0]) | ((~opcode[4]) & opcode[3] & opcode[1] & opcode[0]) | ((~opcode[4]) & opcode[2] & (~opcode[0]));

assign ALUopt[1] = ((~opcode[4]) & (~opcode[2]) & opcode[1]) | 
((~opcode[4]) & opcode[2] & (~opcode[0])) | 
((~opcode[4]) & opcode[3]);

assign ALUopt[0] = ((~opcode[4]) & (~opcode[3]) & (~opcode[1]) &  opcode[0]);

assign executed = ((~condition[0]) & (~zFlag)) | ((~condition[1])&zFlag);


bufif1 g1(WB[1], WBt[1], executed);
bufif1 g2(WB[1], 0, ~(executed));

bufif1 g3(WB[0], WBt[0], executed);
bufif1 g4(WB[0], 0, ~(executed));

bufif1 g5(RWsrc[1], RWsrct[1], executed);
bufif1 g6(RWsrc[1], 0, ~(executed));

bufif1 g7(RWsrc[0], RWsrct[0], executed);
bufif1 g8(RWsrc[0], 0, ~(executed));

bufif1 g9(PCsrc[1], PCsrct[1], executed);
bufif1 g10(PCsrc[1], 0, ~(executed));

bufif1 g11(PCsrc[0], PCsrct[0], executed);
bufif1 g12(PCsrc[0], 0, ~(executed));

bufif1 g13(ALUop[1], ALUopt[1], executed);
bufif1 g14(ALUop[1], 0, ~(executed));

bufif1 g15(ALUop[0], ALUopt[0], executed);
bufif1 g16(ALUop[0], 0, ~(executed));

bufif1 g17(ALUsrc, ALUsrct, executed);
bufif1 g18(ALUsrc, 0, ~(executed));

bufif1 g19(MWR, MWRt, executed);
bufif1 g20(MWR, 0, ~(executed));

bufif1 g21(RBsrc, RBsrct, executed);
bufif1 g22(RBsrc, 0, ~(executed));

bufif1 g23(MRD, MRDt, executed);
bufif1 g24(MRD, 0, ~(executed)); 

bufif1 g25(RegWR, RegWRt, executed);
bufif1 g26(RegWR, 0, ~(executed));


endmodule