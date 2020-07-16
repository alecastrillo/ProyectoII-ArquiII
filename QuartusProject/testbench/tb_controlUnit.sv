module tb_controlUnit();
	
	logic 		clk;
	logic [3:0] op;
	logic 		cond;
	logic 		GET8, PCSrc, ScalarWrite, VectorWrite, HistogramWrite, MemtoReg, MemWrite, Branch, HistSrc, FlagWrite, ImmSrc, VectorOrHistogram;
	logic [1:0] ALUControl;
	logic [2:0] LaneControl;
	
	controlUnit DUT(op, cond, GET8, PCSrc, ScalarWrite, VectorWrite, HistogramWrite, MemtoReg, MemWrite, Branch, HistSrc, FlagWrite, ImmSrc, VectorOrHistogram, ALUControl, LaneControl);
		
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
			op 	<= 4'b0;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b1;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b10;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b11;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b100;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b101;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b110;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b111;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b1000;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b1001;
			cond 	<= 1'b0; 
			# 10; 
			op 	<= 4'b1010;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b1011;
			cond 	<= 1'b0;
			# 10; 
			op 	<= 4'b1100;
			cond 	<= 1'b0;

			
		end
		
endmodule
