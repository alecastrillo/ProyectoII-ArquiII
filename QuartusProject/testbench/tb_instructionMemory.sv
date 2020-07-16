module tb_instructionMemory ();
	logic [31:0] A = 0, RD;
	// instantiate device to be tested 
	instructionMemory DUT (A,RD);
	// initialize test 
	initial 
		begin  
			A        <= 8'b0000;
		end
	
	always 
		begin 
			# 5; 
			A <= A+4; 
			# 5; 
			A <= A+4; 
			# 5; 
			A <= A+4; 
			# 5; 
			A <= A+4; 
			# 5;
		end

endmodule 