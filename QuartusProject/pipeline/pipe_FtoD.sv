module pipe_FtoD(input logic clk,
						  input logic reset,
						  input logic stall, FlushD,PCSrc_W, PCSrc_FtoD, // hazard unit 
						  input logic [31:0] InstrF,
						  output logic [31:0] InstrD);

	// Registro entre Fetch y Decode
	always_ff @( posedge clk, posedge reset )
		begin
			//como siempre, al ser un flipflop, si hay un reset se resetea en 0
			if (reset)
				InstrD <= 0;
			else
				//si el reset no esta activado seguimos normalmente
				begin
					//Si el hazardUnit nos esta diciendo que hagamos un flush
					if (FlushD || PCSrc_W) begin
 
						InstrD <= 0;
					//si en cambio, el StallD esta en 0, entonces al estar negada la entrada nos da un 1, por lo que damos como resultado 
					//la instruccion de entrada 
					end else if (~stall)
 
						InstrD <= InstrF;
			end
		end
endmodule  
				  