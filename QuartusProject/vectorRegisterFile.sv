module vectorRegisterFile (input logic 			clk,WE,
									input logic 		 	first_source_register,
									input logic 		 	destination_register,
									input logic [63:0] 	WD,
									output logic [63:0] 	RD);
							
	// Total of 2 registers 64 bits each
	logic [63:0] vector_register_memory [1:0];
	
	// Initialize registers
	initial  
		begin
			$readmemh("mem_vectorRegisters.mem",vector_register_memory);
		end
		
	always_ff@(negedge clk)  
		// Writes in register when WriteEnable = True
		if(WE)
			vector_register_memory[destination_register] = WD;
			
	assign RD =  vector_register_memory[first_source_register];

endmodule
