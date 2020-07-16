module tb_LANES();

					//flags 3 2 1 0
					//      N Z C V  -> N Z C V

					//LaneControl [2:1]
					//00 divs
					//01 muls
					//10 inc
					//11 mods
					
					//LaneControl [0]
					//0 16 bits
					//1  8 bits
					
					//Idx
	
	logic				clk;
	logic [2:0] 	LaneControl;
	logic [63:0] 	Rv;				// Vector register 
	logic [15:0] 	SrcB; 			// Scalar register or immediate 
	logic [1:0]		Idx; 				// For one vector instructions (inc1)
	logic [63:0] 	Res;
	
	LANES DUT(LaneControl, Rv, SrcB, Idx, Res);

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
			Rv 				<= 64'h0100020003000400;
			SrcB 				<= 16'b1111111;
			Idx 				<= 2'b00;
			# 10; 
			// MULS 4x16  
			LaneControl 	<= 3'b010;
			Rv 				<= 64'h0010020003000400;
			SrcB 				<= 16'b11; 
			Idx 				<= 2'b00; 
			# 10; 
			// INC 4x16  (applied only in index 1)
			LaneControl 	<= 3'b100;
			Rv 				<= 64'h0100020003000400;
			SrcB 				<= 16'b0;
			Idx 				<= 2'b01;
			# 10; 
			// MODS 4x16  
			LaneControl 	<= 3'b110;
			Rv 				<= 64'h00FF00450089004F;
			SrcB 				<= 16'b100;
			Idx 				<= 2'b00;
			
		end

endmodule 