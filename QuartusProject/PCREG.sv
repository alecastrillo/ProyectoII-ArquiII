module PCREG (input logic 				clk, reset, enable,
				  input logic [15:0] 	PC_IN,
				  output logic [15:0] 	PC_OUT);

			always_ff @( posedge clk, posedge reset )
				begin
					if (reset) 	
						PC_OUT <= 0;
					else //if (enable) 
						PC_OUT <= PC_IN;
				end
endmodule  