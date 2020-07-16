module pipe_EtoM(input logic clk,
						  input logic reset,
						  input logic enable, Flush_M, // hazard unit 
						  
						  input logic PCSrc_E, ScalarWrite_E, VectorWrite_E, HistogramWrite_E, MemtoReg_E, MemWrite_E,
						  input logic [15:0] ALUResult_E, 
						  input logic [63:0] LanesResult_E,
						  input logic [7:0] RhD_E,
						  input logic RvD_E,
						  input logic [2:0] RnD_E,
						  
						  output logic PCSrc_M, ScalarWrite_M, VectorWrite_M, HistogramWrite_M, MemtoReg_M, MemWrite_M,
						  output logic [15:0] ALUResult_M, 
						  output logic [63:0] LanesResult_M,
						  output logic [7:0] RhD_M,
						  output logic RvD_M,
						  output logic [2:0] RnD_M);

	// Registro entre Fetch y Decode
	always_ff @( posedge clk, posedge reset )
		begin
			//como siempre, al ser un flipflop, si hay un reset se resetea en 0
			if (reset) begin
				PCSrc_M <= 0;
				ScalarWrite_M <= 0;
				VectorWrite_M <= 0;
				HistogramWrite_M <= 0;
				MemtoReg_M <= 0;
				MemWrite_M  <= 0;
				ALUResult_M <= 16'b0;
				LanesResult_M <= 64'b0;
				RhD_M <= 8'b0;
				RvD_M <= 0;
				RnD_M <= 3'b0;
			end else begin
				PCSrc_M 				<= PCSrc_E;
				ScalarWrite_M 		<= ScalarWrite_E;
				VectorWrite_M 		<= VectorWrite_E;
				HistogramWrite_M 	<= HistogramWrite_E;
				MemtoReg_M 			<= MemtoReg_E;
				MemWrite_M  		<= MemWrite_E;
				ALUResult_M 		<= ALUResult_E;
				LanesResult_M 		<= LanesResult_E;
				RhD_M 				<= RhD_E;
				RvD_M 				<= RvD_E;
				RnD_M 				<= RnD_E;
			end
		end
endmodule 
						  
 