module mux_GET8 (input logic [63:0] LanesResult, Get8Result,
						input logic GET8,
						output logic [63:0] Out);
					
		assign Out = ( GET8 ) ? Get8Result : LanesResult;
 
endmodule 