module mux_VorH (input logic [63:0] RD_Hist, RD_V,
						input logic VectorOrHistogram,
						output logic [63:0] RvOut);
					
		assign RvOut = ( VectorOrHistogram ) ? RD_Hist : RD_V;

endmodule 