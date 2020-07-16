module tb_ALU();
	logic clk;
	logic [15:0] A, B, Res;
	logic [1:0] ALUControl;
	logic [4:0] Flags;
	
	ALU DUT(A,B,ALUControl, Flags, Res);
					
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
			ALUControl  	<= 2'b00;
			A					<= 16'b111;
			B  				<= 16'b111;
			# 10;  
			ALUControl  	<= 2'b00; 
			A					<= 16'b1111111111111111;
			B  				<= 16'b111;
			# 10;  
			ALUControl  	<= 2'b00;
			A					<= 16'b1111111111111111;
			B  				<= 16'b1;
			# 10;   
			ALUControl  	<= 2'b01;
			A					<= 16'b111;
			B  				<= 16'b0;
			# 10;  
			ALUControl  	<= 2'b10;
			A					<= 16'b111;
			B  				<= 16'b111;
			
		end
	
	
	
endmodule 