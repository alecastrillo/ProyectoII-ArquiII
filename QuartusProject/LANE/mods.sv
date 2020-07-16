module mods(input logic [15:0]  	V,		 		 // Vector source
				input logic [15:0]	S,				 // Scalar source
			   output logic [15:0] 	Res);			 // Result
	
	logic [15:0] tmp;
	
	always_comb
	begin
		tmp 		  <= V;
		tmp[9:8]   <= 2'b00;
		tmp[1:0]   <= 2'b00;
		Res[7:0]   <= V[7:0]/3'b100;
		Res[15:8]  <= V[15:8]/3'b100;
		Res[7:6]   <= V[1:0];
		Res[15:14] <= V[9:8];
	end
 
endmodule  