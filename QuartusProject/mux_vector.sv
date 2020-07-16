module mux_vector(input logic [63:0] 	Rv,
						input logic [2:0]		Selector,
						output logic [7:0]	Res);
	always_comb
		case(Selector)
			3'b000: Res = Rv[7:0];
			3'b001: Res = Rv[15:8];
			3'b010: Res = Rv[23:16];
			3'b011: Res = Rv[31:24];
			3'b100: Res = Rv[39:32];
			3'b101: Res = Rv[47:40];
			3'b110: Res = Rv[55:48];
			3'b111: Res = Rv[63:56];
		default: Res = Rv[7:0];
		endcase
		
endmodule 