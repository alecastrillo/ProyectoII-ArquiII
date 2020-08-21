module ALU(input logic [15:0] 	A, B,
			  input logic [2:0] 		ALUControl,
			  input logic EQ,
			  output logic [4:0] 	Flags,
			  output logic [15:0] 	RESULT);
											
					//flags 4 3 2 1 0
					//      E N Z C V   -> E N Z C V

					//ALUControl 
					//00 add
					//01 inc
					//10 cmp
					//11 load or store
					//100 mov b
					//101 bnq 
					
					initial begin
						Flags = 5'b0;
					end
					
					logic cout, cmp_res;
					logic [15:0] add_res, inc_res, ls_res;
					
					add ADD(A, B, 0, add_res, cout);
					add INC(A, 16'b01, 0, inc_res, cout);
					cmp CMP(A, B, cmp_res);
					
					assign ls_res = A;
					
					//MUX de la alu
					mux_ALU mux_ALU(add_res, inc_res, A, B, EQ, ALUControl, RESULT);
					
					//Calcula las flags
					flags flags_F(A,B,suma_R,RESULT,cout, cmp_res, ALUControl,Flags);
					
					
											
endmodule 
	  