module mux_pc (input logic [31:0] next_pc, branch_pc,
					input logic sel,
					output logic [31:0] pc);
					
		assign pc = ( sel ) ? branch_pc : next_pc;

endmodule  