module tb_vectorRegisterFile ();
	logic clk,WE;
	logic first_source_register, destination_register;
	logic [63:0] WD, RD;
	
	// Instantiate device to be tested 
	vectorRegisterFile DUT(clk,WE,first_source_register,destination_register,WD,RD);
	
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
			first_source_register 	<= 1'b0; 
			destination_register 	<= 1'b0; 
			WD 							<= 0;
			# 10; 
			WE 							<= 0;
			first_source_register 	<= 1'b1; 
			destination_register 	<= 1'b1; 
			WD 							<= 0;
			# 10; 
			WE 							<= 1;
			first_source_register 	<= 1'b0; 
			destination_register 	<= 1'b1; 
			WD 							<= 64'b01;
			# 10; 
			WE 							<= 0;
			first_source_register 	<= 1'b1; 
			destination_register 	<= 1'b0; 
			WD 							<= 0;
		end

endmodule 