module mux_HSrc (input logic [7:0] RD_SR, RD_VR,
						input logic HistSrc,
						output logic [7:0] Out);
					
		assign Out = ( HistSrc ) ? RD_SR : RD_VR;

endmodule  