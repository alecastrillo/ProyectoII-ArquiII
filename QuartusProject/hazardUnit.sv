module hazardUnit (input logic [3:0] op,
						 input logic PC_W,ScalarWrite_E, ScalarWrite_M, ScalarWrite_W,VectorWrite_E,VectorWrite_M, VectorWrite_W,HistogramWrite_E,HistogramWrite_M,HistogramWrite_W,
						 input logic RvD_E, RvD_M, RvD_W, Rv,
						 input logic [2:0] RnD_E, RnD_M, RnD_W, RnA, RnB,
						 input logic [7:0] RhD_E, RhD_M, RhD_W, Rh,
						 output logic stall_D, stall_F, stall_E, Flush_D, Flush_E, match[3:0]);
			
		
	assign stall_E= 0;
	
	assign Flush_E = match[0] || match[1] || match[2] || match[3];
	
	assign Flush_D = ((op==4'b0100 || op==4'b0101) ? 1: 
						   (PC_W) ? 0: Flush_D);
	
	assign stall_F = Flush_E || Flush_D;	
	assign stall_D = stall_F ;

	assign match[0] = ((RnD_E == RnA) && ScalarWrite_E) || ((RnD_M == RnA) && ScalarWrite_M)|| ((RnD_W == RnA) && ScalarWrite_W);
	assign match[1] = ((RnD_E == RnB) && ScalarWrite_E) || ((RnD_M == RnB) && ScalarWrite_M)|| ((RnD_W == RnB) && ScalarWrite_W);
	assign match[2] = ((RvD_E == Rv) && VectorWrite_E) || ((RvD_M == Rv) && VectorWrite_M)|| ((RvD_W == Rv) && VectorWrite_W);
	assign match[3] = ((RhD_E == Rh) && HistogramWrite_E) || ((RhD_M == Rh) && HistogramWrite_M)|| ((RhD_W == Rh) && HistogramWrite_W);
 
	
 
	//assign Flush_E = stall_E;
	
						  
endmodule    