module pipe_DtoE(input logic clk,
						  input logic reset,
						  input logic stall, Flush_E, // hazard unit 
						  input logic GET8_D, PCSrc_D, ScalarWrite_D, VectorWrite_D, HistogramWrite_D, MemtoReg_D, MemWrite_D, Branch_D, 
						  input logic [2:0] LanesControl_D, 
						  input logic [4:0] Flags_D,
						  input logic [2:0] ALUControl_D,
						  input logic ImmSrc_D,
						  
						  input logic [15:0] Imm_D, RnDA_D, RnDB_D, 
						  input logic [63:0] RvDA_D,
						  input logic [7:0] RhD_D,
						  input logic RvD_D,
						  input logic [2:0] RnD_D,
						  
						  output logic GET8_E, PCSrc_E, ScalarWrite_E, VectorWrite_E, HistogramWrite_E, MemtoReg_E, MemWrite_E, Branch_E, 
						  output logic [2:0] LanesControl_E, 
						  output logic [4:0]Flags_E,
						  output logic [2:0] ALUControl_E,
						  output logic ImmSrc_E,
						  
						  output logic [15:0] Imm_E, RnDA_E, RnDB_E, 
						  output logic [63:0] RvDA_E,
						  output logic [7:0] RhD_E,
						  output logic RvD_E,
						  output logic [7:9] RnD_E
						  );

	// Registro entre Decode y Execute
	always_ff @( posedge clk, posedge reset )
		begin
			//como siempre, al ser un flipflop, si hay un reset se resetea en 0
			if (reset) begin
				GET8_E <=0;
				PCSrc_E <=0;
				ScalarWrite_E <=0;
				VectorWrite_E <=0;
				HistogramWrite_E <=0;
				MemtoReg_E <=0;
				MemWrite_E <=0;
				Branch_E <=0;
				LanesControl_E <=3'b0;
				Flags_E <=5'b0;
				ALUControl_E<=3'b0;
				ImmSrc_E<=0;
				Imm_E<=16'b0;
				RnDA_E<=16'b0;
				RnDB_E<=16'b0;
				RvDA_E<=64'b0;
				RhD_E<=8'b0;
				RvD_E<=0;
				RnD_E<=3'b0;
			end else begin
					//Si el hazardUnit nos esta diciendo que hagamos un flush
					if (Flush_E) begin 
						GET8_E <=0;
						PCSrc_E <=0;
						ScalarWrite_E <=0;
						VectorWrite_E <=0;
						HistogramWrite_E <=0;
						MemtoReg_E <=0;
						MemWrite_E <=0;
						Branch_E <=0;
						LanesControl_E <=3'b0;
						Flags_E <=5'b0;
						ALUControl_E<=3'b0;
						ImmSrc_E<=0;
						Imm_E<=16'b0;
						RnDA_E<=16'b0;
						RnDB_E<=16'b0;
						RvDA_E<=64'b0;
						RhD_E<=8'b0;
						RvD_E<=0;
						RnD_E<=3'b0;
					end else begin
						if (~stall) begin
							GET8_E 					<=GET8_D;
							PCSrc_E 					<=PCSrc_D;
							ScalarWrite_E 			<=ScalarWrite_D;
							VectorWrite_E 			<=VectorWrite_D;
							HistogramWrite_E 		<=HistogramWrite_D;
							MemtoReg_E 				<=MemtoReg_D;
							MemWrite_E 				<=MemWrite_D; 
							Branch_E 				<=Branch_D;
							LanesControl_E 		<=LanesControl_D;
							Flags_E 				<=Flags_D;
							ALUControl_E			<=ALUControl_D;
							ImmSrc_E					<=ImmSrc_D;
							Imm_E						<=Imm_D;
							RnDA_E					<=RnDA_D;
							RnDB_E					<=RnDB_D;
							RvDA_E					<=RvDA_D;
							RhD_E						<=RhD_D;
							RvD_E						<=RvD_D;
							RnD_E						<=RnD_D;
						end
					end
				end
			
			
			
		end
endmodule 
						  
 