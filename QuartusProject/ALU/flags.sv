module flags(	input logic [15:0] A,B,SUM,result,
											input logic cout, cmp_res,
											input logic [1:0] ALUControl,
											output logic [4:0] FLAGS);
				//flags 3 2 1 0
				//      N Z C V
				logic Z,N,C,V, EQ;
				assign V = ~(~ALUControl[1] ^ A[15] ^ B[15]) & (A[15]^SUM[15]) & (~ALUControl[1]);
				assign C = (~ALUControl[1]) & cout;
				assign N = result[15];
				assign EQ = ALUControl[1] & (~ALUControl[0]) & cmp_res;
				
				always_comb
					begin
						if(result==0)
								Z=1;
						else
								Z=0;
					end
				assign FLAGS = {EQ,N,Z,C,V}; 
endmodule
  