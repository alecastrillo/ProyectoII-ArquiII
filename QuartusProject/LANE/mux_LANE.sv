module mux_LANE (input logic [15:0] NORM, LS, INC, MODS,
					  input logic [1:0] SELECTOR,
					  output logic [15:0] RES);
				 
		always_comb
			case(SELECTOR)
				2'b00: RES = NORM;
				2'b01: RES = LS;
				2'b10: RES = INC;
				2'b11: RES = MODS;
			default: RES = LS; 
			endcase
endmodule 