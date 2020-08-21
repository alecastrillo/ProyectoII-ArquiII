module norm(input logic 		  	Size, 		 // 0 for 16bits 1 for 8bits
				input logic [15:0]  	V,		 		 // Vector source
			   output logic [15:0] 	Res);				
	logic [31:0] tmp;
	assign tmp = (V*255)/65535;
	assign Res = tmp[15:0];

endmodule 