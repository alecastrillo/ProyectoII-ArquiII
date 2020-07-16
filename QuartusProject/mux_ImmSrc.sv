module mux_ImmSrc (input logic [15:0] A, Imm,
						input logic ImmSrc,
						output logic [15:0] Out);
					
		assign Out = ( ImmSrc ) ? Imm : A;

endmodule  