module LANES (input logic [2:0]		LaneControl, 	// 0 -> Size
																	// 2:1 -> OP
				  input logic [63:0] 	Rv,				// Vector register 
				  input logic [15:0] 	SrcB, 			// Scalar register or immediate 
				  input logic [1:0]		Idx, 				// For one vector instructions (inc1)
				  output logic [63:0] 	Res);				// Result
	
	lane  lane3 (LaneControl, 2'b11, Rv[63:48], Idx, SrcB, Res[63:48]);
	lane  lane2 (LaneControl, 2'b10, Rv[47:32], Idx, SrcB, Res[47:32]);
	lane  lane1 (LaneControl, 2'b01, Rv[31:16], Idx, SrcB, Res[31:16]);
	lane  lane0 (LaneControl, 2'b00, Rv[15:0] , Idx, SrcB, Res[15:0] );
	
endmodule

