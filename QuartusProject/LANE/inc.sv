module inc(input logic [15:0] V,
			  input logic [1:0] Idx,
			  input logic [1:0] LaneId,
			  output logic [15:0] Res);
			  
	assign Res = ( Idx==LaneId ) ? (V+16'b1) : V;
	/*
	always_comb 
	begin
		if (Idx==LaneId)
			Res <= (V+16'b1);
		else 
			Res <= (V+16'b10);
	end*/  

endmodule 