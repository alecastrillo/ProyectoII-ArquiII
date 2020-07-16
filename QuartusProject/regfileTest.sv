module regfileTest(input logic clk,WE,
							input logic [1:0] Op,
							input logic [3:0] first_source_register,
							input logic [3:0] second_source_register,
							input logic [3:0] fourth_source_register,
							input logic [3:0] destination_register,
							input logic [31:0] WD,R15,
							output logic [31:0] RD1,RD2,RD3,RD4);
							//						   a   BX  c   EX
	//memoria de 15 registros 
	logic [31:0] register_memory [14:0];
	logic [3:0] pos_R15 = 4'b1111;
	initial 
		$readmemh("register.mem",register_memory);
	always_ff@(negedge clk)
		// si se quiere escribir en algun registro
		if(WE)
			// se escribe
			register_memory[destination_register] = WD;
	always_comb
			begin
				//se revisa si el registro que se busca es el PC
				if(first_source_register == pos_R15)
					//si es asi se le da el valor del PC a la salida RD1
					RD1 <= R15;
				//si no 
				else
					//se busca el valor en memoria y retorna en RD1
					RD1 <= register_memory[first_source_register];
				//se revisa si el registro que se busca es el PC
				if(second_source_register == pos_R15)
					//si es asi se le da el valor del PC a la salida RD2
					RD2 <= R15;
				else
					//se busca el valor en memoria y retorna en RD2
					RD2 <= register_memory[second_source_register];
				if(Op==2'b11)
					begin 
						RD3 <= register_memory[destination_register];//c
						RD4 <= register_memory[fourth_source_register];//EX
					end
				else
					begin 
					//para no dividir entre cero le doy un valor de 1
						RD3 <= 32'b1;
						RD4 <= 32'b1;
					end
			end
endmodule
