module pipe_MtoW(input logic clk,
						  input logic reset,
						  input logic enable, FlushW, // hazard unit 
						  input logic PCSrc_M, ScalarWrite_M, VectorWrite_M, HistogramWrite_M, MemtoReg_M,
						  input logic [15:0] ALUResult_M,
						  input logic [63:0] DataFromMem_M, 
						  input logic [63:0] LanesResult_M, 
						  input logic [7:0] 	RhD_M,
						  input logic 		  	RvD_M,
						  input logic [2:0] 	RnD_M,
						  
						  output logic PCSrc_W, ScalarWrite_W, VectorWrite_W, HistogramWrite_W, MemtoReg_W,
						  output logic [15:0] ALUResult_W,
						  output logic [63:0] DataFromMem_W, 
						  output logic [63:0] LanesResult_W, 
						  output logic [7:0] 	RhD_W,
						  output logic 		  	RvD_W,
						  output logic [2:0] 	RnD_W
						  );

	// Registro entre Fetch y Decode
	always_ff @( posedge clk, posedge reset )
		begin
			//como siempre, al ser un flipflop, si hay un reset se resetea en 0
			if (reset) begin
				PCSrc_W <= 0;
				ScalarWrite_W <= 0;
				VectorWrite_W <= 0;
				HistogramWrite_W <= 0;
				MemtoReg_W <= 0;
				ALUResult_W <= 16'b0;
				DataFromMem_W <= 64'b0;
				LanesResult_W <= 64'b0;
				RhD_W <= 8'b0;
				RvD_W <= 0;
				RnD_W <= 3'b0;
			end else begin
				PCSrc_W <= PCSrc_M;
				ScalarWrite_W <= ScalarWrite_M;
				VectorWrite_W <= VectorWrite_M;
				HistogramWrite_W <= HistogramWrite_M;
				MemtoReg_W <= MemtoReg_M;
				ALUResult_W <= ALUResult_M;
				DataFromMem_W <= DataFromMem_M;
				LanesResult_W <= LanesResult_M;
				RhD_W <= RhD_M;
				RvD_W <= RvD_M;
				RnD_W <= RnD_M;
			end
		end
endmodule 
						  