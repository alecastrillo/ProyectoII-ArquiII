module mux_ALU (input logic [15:0] ADD, INC,A,B,
					 input logic EQ,
					  input logic [2:0] SELECTOR,
					  output logic [15:0] RES);
				 
		always_comb
			case(SELECTOR)
				3'b000: RES = ADD;
				3'b001: RES = INC;
				3'b011: RES = A;
				3'b100: RES = B;
				3'b101: RES = (EQ) ? A : B; 
			default: RES = B;
			endcase
endmodule 