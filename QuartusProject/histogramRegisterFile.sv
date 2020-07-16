module histogramRegisterFile (input logic 			clk,WE,GET8,
										input logic [5:0]	 	A1,
										input logic [5:0] 	A2,
										input logic [63:0]	Rv,
										input logic [63:0] 	WD,
										output logic [63:0] 	RD);
							
	// Total of 64 vector registers 64 bits each
	logic [3:0][15:0] histogram_register_memory [63:0];
	
	// Initialize registers
	initial  
		begin
			$readmemh("mem_histogramRegisters.mem",histogram_register_memory);
		end
		 
	always_ff@(negedge clk)  begin
		// Writes in register when WriteEnable = True
		if(WE) 
			histogram_register_memory[A2] = WD;
	end
		
	always_comb 
	begin
		if(GET8) begin
			RD[63:56] <= histogram_register_memory[Rv[61:56]][Rv[63:62]][7:0];
			RD[55:48] <= histogram_register_memory[Rv[53:48]][Rv[55:54]][7:0];
			RD[47:40] <= histogram_register_memory[Rv[45:40]][Rv[47:46]][7:0]; 
			RD[39:32] <= histogram_register_memory[Rv[37:32]][Rv[39:38]][7:0];
			RD[31:24] <= histogram_register_memory[Rv[29:24]][Rv[31:30]][7:0];
			RD[23:16] <= histogram_register_memory[Rv[21:16]][Rv[23:22]][7:0];
			RD[15:8]  <= histogram_register_memory[Rv[13:8]][Rv[15:14]][7:0];
			RD[7:0]   <= histogram_register_memory[Rv[5:0]][Rv[7:6]][7:0];
		end else begin
			RD <= histogram_register_memory[A1]; 
		end
	end
	
endmodule
