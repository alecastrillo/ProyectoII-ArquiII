module mux_ALU (input logic [15:0] ADD, INC,LS,MOV,
					  input logic [2:0] SELECTOR,
					  output logic [15:0] RES);
				 
		always_comb
			case(SELECTOR)
				3'b000: RES = ADD;
				3'b001: RES = INC;
				3'b011: RES = LS;
				3'b100: RES = MOV;
			default: RES = MOV;
			endcase
endmodule 