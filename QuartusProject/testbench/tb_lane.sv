module tb_lane();
	logic [2:0] 	LaneControl; 	// 0 -> Size
											// 2:1 -> OP
	logic [1:0]		LaneId;			// 0, 1, 2 o 3
	logic [15:0] 	V;					// Vector  
	logic [1:0]		Idx; 				// For one vector instructions (inc1)
	logic [15:0] 	SrcB; 			// Scalar register or immediate 
	logic [15:0] 	Res;	
	
	logic booleanTest, clk;
	
	lane DUT(LaneControl, LaneId, V, Idx,SrcB, Res);

	assign LaneId = 2'b01;

	
	always  
		begin 
			clk <= 1; 
			# 5; 
			clk <= 0; 
			# 5;
		end
	
	always 
		begin 
			# 10; 
			// DIVS 4x16  
			LaneControl 	<= 3'b000;
			V					<= 16'b0001000000000111;
			SrcB 				<= 16'b11;
			Idx 				<= 2'b00;
			booleanTest    <= (Idx == LaneId);
			# 10; 
			// MULS 4x16  
			LaneControl 	<= 3'b010; 
			V					<= 16'b111;
			SrcB 				<= 16'b111;
			Idx 				<= 2'b00;
			booleanTest    <= (Idx == LaneId);
			# 10; 
			// INC 4x16  (applied only in index 1) 
			LaneControl 	<= 3'b100;
			V					<= 16'b111;
			SrcB 				<= 16'b111;
			Idx 				<= 2'b01;
			booleanTest    <= (Idx == LaneId);
			# 10; 
			// INC 4x16  (applied only in index 1)
			LaneControl 	<= 3'b100;
			V					<= 16'b111;
			SrcB 				<= 16'b111;
			Idx 				<= 2'b00; 
			booleanTest    <= (Idx == LaneId);
			# 10; 
			// MODS 4x16  
			LaneControl 	<= 3'b110;
			V					<= 16'b111;
			SrcB 				<= 16'b111;
			Idx 				<= 2'b00; 
			booleanTest    <= (Idx == LaneId);
			
		end

endmodule 