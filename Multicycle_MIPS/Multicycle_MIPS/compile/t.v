//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Multicycle_MIPS
// Author      : amohd63
// Company     : BZU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\alima\Desktop\BZU\4th year\Architecture\pythonProject\Multicycle_MIPS\Multicycle_MIPS\compile\t.v
// Generated   : Wed Feb 15 00:17:33 2023
// From        : C:\Users\alima\Desktop\BZU\4th year\Architecture\pythonProject\Multicycle_MIPS\Multicycle_MIPS\src\t.bde
// By          : Bde2Verilog ver. 2.01
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1ps / 1ps

module t ;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------- Component instantiations -------//

register_file U10
(
	.Ra({3{Dangling_Input_Signal}}),
	.Rb({3{Dangling_Input_Signal}}),
	.Rw({3{Dangling_Input_Signal}}),
	.enWrite(Dangling_Input_Signal),
	.clk(Dangling_Input_Signal),
	.reset(Dangling_Input_Signal),
	.BusA(),
	.BusB(),
	.BusW({24{Dangling_Input_Signal}})
);



update_flags U11
(
	.opcode({5{Dangling_Input_Signal}}),
	.SF(Dangling_Input_Signal),
	.prevZ(Dangling_Input_Signal),
	.prevBEQ(Dangling_Input_Signal),
	.currZ(Dangling_Input_Signal),
	.currBEQ(Dangling_Input_Signal),
	.zFlag(),
	.BEQFlag()
);



mux2to1 U3
(
	.in1({24{Dangling_Input_Signal}}),
	.in2({24{Dangling_Input_Signal}}),
	.s(Dangling_Input_Signal),
	.out()
);



mux4_1 U4
(
	.in1({24{Dangling_Input_Signal}}),
	.in2({24{Dangling_Input_Signal}}),
	.in3({24{Dangling_Input_Signal}}),
	.in4({24{Dangling_Input_Signal}}),
	.s1(Dangling_Input_Signal),
	.s2(Dangling_Input_Signal),
	.out()
);



alu U5
(
	.A({24{Dangling_Input_Signal}}),
	.B({24{Dangling_Input_Signal}}),
	.ALUop({2{Dangling_Input_Signal}}),
	.out(),
	.zFlag()
);



instruction_memory U6
(
	.address({24{Dangling_Input_Signal}}),
	.out_data(),
	.clk(Dangling_Input_Signal),
	.reset(Dangling_Input_Signal)
);



memory_data U7
(
	.out_data(),
	.address({24{Dangling_Input_Signal}}),
	.in_data({24{Dangling_Input_Signal}}),
	.memRd(Dangling_Input_Signal),
	.memWr(Dangling_Input_Signal),
	.clk(Dangling_Input_Signal),
	.reset(Dangling_Input_Signal),
	.PCsrc({2{Dangling_Input_Signal}})
);



control_unit U8
(
	.reset(Dangling_Input_Signal),
	.clk(Dangling_Input_Signal),
	.opcode({5{Dangling_Input_Signal}}),
	.condition({2{Dangling_Input_Signal}}),
	.zFlag(Dangling_Input_Signal),
	.BEQFlag(Dangling_Input_Signal),
	.RBsrc(),
	.RWsrc(),
	.RegWR(),
	.ALUs(),
	.ALUop(),
	.MRD(),
	.MWR(),
	.WB()
);



pc_control U9
(
	.reset(Dangling_Input_Signal),
	.clk(Dangling_Input_Signal),
	.opcode({5{Dangling_Input_Signal}}),
	.condition({2{Dangling_Input_Signal}}),
	.zFlag(Dangling_Input_Signal),
	.BEQFlag(Dangling_Input_Signal),
	.PCsrc()
);



endmodule 
