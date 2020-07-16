module tb_histogramRegisterFile ();
	logic clk,WE,GET8;
	logic [5:0] A1, A2;
	logic [63:0] Rv, WD, RD;
	
	// Instantiate device to be tested 
	histogramRegisterFile DUT(clk,WE,GET8,A1,A2,Rv,WD,RD);
	
	// Initialize test 
	initial 
		begin   
			WE <= 0;
		end
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
			WE 							<= 0;
			A1							 	<= 6'b000001; 
			A2							 	<= 6'b0;  
			GET8 							<= 1;
			WD 							<= 0;
			Rv								<= 64'b1100000010000000010000000000000011000000100000000100000000000000; 
			# 10; 
			WE 							<= 1;
			A1							 	<= 6'b10;  
			A2							 	<= 6'b10;  
			GET8 							<= 0;
			WD 							<= 63'b0000000010000010010000000000000011000000100000000100000000000000;
			Rv								<= 64'b1100000010000000010000000000000011000000100000000100000000000000; 
			# 10; 
			WE 							<= 0;
			A1							 	<= 6'b10;  
			A2							 	<= 6'b0;  
			GET8 							<= 0;
			WD 							<= 0;
			Rv								<= 64'b1100000010000000010000000000000011000000100000000100000000000000; 
		end

endmodule 