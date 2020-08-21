module lane (input logic [2:0]	LaneControl, 	// 0 -> Size
																// 2:1 -> OP
				 input logic [1:0]	LaneId,			// 0, 1, 2 o 3
				 input logic [15:0] 	V,					// Vector register 
				 input logic [1:0]	Idx, 				// For one vector instructions (inc1)
				 input logic [15:0] 	SrcB, 			// Scalar register or immediate 
				 output logic [15:0] Res);				// Result

		
	logic 			IdxFlag;
	logic [15:0] 	norm_res, inc_res, ls_res, mods_res;
	 
	always_comb
	begin
		IdxFlag <= (LaneId == Idx);
	end
	 
	norm  NORM (LaneControl[0], V, norm_res);
	inc   INC  (V, Idx, LaneId, inc_res);
	ls 	LS (LaneControl[0], V, SrcB, ls_res); 
	mods  MODS (V, SrcB, mods_res);
		
	mux_LANE mux_lane(norm_res, ls_res, inc_res, mods_res, LaneControl[2:1], Res);
 
endmodule
