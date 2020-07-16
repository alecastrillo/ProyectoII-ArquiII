module instructionMemory ( input logic [15:0] A,
								   output logic [31:0] RD
									);
	// Tamaño de memoria de instrucciones 32x32
	logic [0:31] memory [0:63];
	initial
		begin 
			$readmemb("mem_instructionMemory.dat",memory);
		end

	assign RD = memory[A[15:2]]; // Word aligned

endmodule 