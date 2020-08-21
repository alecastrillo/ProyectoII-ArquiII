module ls(input logic 		  	Size, 		 // 0 for 16bits 1 for 8bits
				input logic [15:0]  	V,			 // Vector source
				input logic [15:0]	S,		 	 // Scalar source
			   output logic [15:0] 	Res);				
	
	assign Res = V;
 
endmodule  