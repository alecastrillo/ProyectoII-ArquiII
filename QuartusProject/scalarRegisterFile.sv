module scalarRegisterFile (input logic 			clk,WE,
									input logic [2:0] 	first_source_register,
									input logic [2:0] 	second_source_register,
									input logic [2:0] 	destination_register,
									input logic [15:0] 	WD,R7,
									output logic [15:0] 	RD1,RD2);
							
	// Total of 8 registers 16 bits each
	logic [15:0] scalar_register_memory [7:0];
	
	// Initialize registers
	initial  
		begin
			$readmemh("mem_scalarRegisters.mem",scalar_register_memory);
		end
		
	always_ff@(negedge clk)  
		// Writes in register when WriteEnable = True
		if(WE)
			scalar_register_memory[destination_register] = WD;
			
	assign RD1 = ( first_source_register == 3'b111) ? R7 : scalar_register_memory[first_source_register];
	assign RD2 = ( second_source_register == 3'b111) ? R7 : scalar_register_memory[second_source_register];

endmodule
