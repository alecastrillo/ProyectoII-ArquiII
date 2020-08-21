module PCREG (input logic 				clk, reset, stall, PCSrc_W,
				  input logic [15:0] 	PC_IN,
				  output logic [15:0] 	PC_OUT,
				  output logic PCSrc_FtoD);

			always_ff @( posedge clk, posedge reset )
				begin
					if (reset ) begin	
						PC_OUT <= 0;
						PCSrc_FtoD <= 0;
					end else begin
						if (~stall) begin
							PC_OUT <= PC_IN;
							PCSrc_FtoD <= PCSrc_W;
						end 
					end
				end
endmodule   