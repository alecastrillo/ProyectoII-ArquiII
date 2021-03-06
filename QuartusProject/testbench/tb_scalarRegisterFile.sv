module tb_scalarRegisterFile ();
	logic clk,WE;
	logic [2:0] first_source_register;
	logic [2:0] second_source_register;
	logic [2:0] destination_register;
	logic [15:0] WD,R7;
	logic [15:0] RD1,RD2;
	
	// Instantiate device to be tested 
	scalarRegisterFile DUT(clk,WE,first_source_register,second_source_register,destination_register,WD,R7,RD1,RD2);
	
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
			first_source_register 	<= 3'b100; 
			second_source_register 	<= 3'b001; 
			destination_register 	<= 3'b010;
			WD 							<= 0;
			R7 							<= 0;
			# 10; 
			WE 							<= 1;
			first_source_register 	<= 3'b000; 
			second_source_register 	<= 3'b000; 
			destination_register 	<= 3'b100;
			WD 							<= 16'b0001110010100111;
			R7 							<= 0;
			# 10; 
			WE 							<= 0;
			first_source_register 	<= 3'b100;  
			second_source_register 	<= 3'b000; 
			destination_register 	<= 3'b000;
			WD 							<= 0;
			R7 							<= 0;
			# 10; 
			WE 							<= 0;
			first_source_register 	<= 3'b111; 
			second_source_register 	<= 3'b000; 
			destination_register 	<= 3'b000;
			WD 							<= 0;
			R7 							<= 0;
		end

endmodule 