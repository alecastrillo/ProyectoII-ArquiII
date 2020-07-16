module mux_WB (input logic [63:0] DataFromMem, VectRes,
					input logic MemtoReg,
					output logic [63:0] out);
					
		assign out = ( MemtoReg ) ? DataFromMem : VectRes;

endmodule 