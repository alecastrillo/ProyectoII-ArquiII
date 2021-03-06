module tb_decoder();
	
	logic clk;
	
	logic [0:31] 	Instr;
	logic [3:0] 	op;
	logic 		 	cond, RvD, RvS;
	logic [2:0] 	RnD, RnSA, RnSB;
	logic [16:0] 	Imm;
	
	decoder DUT(Instr, op,cond, RvD, RvS,RnD, RnSA, RnSB,Imm);
	
	always  
		begin 
			clk <= 1; 
			# 5; 
			clk <= 0; 
			# 5;
		end
	
	always 
		begin 
			# 10; 
			Instr = 32'b00001010000110100110000010000000;
			# 10; 
			Instr = 32'b01100010110110100000010000100000;

		end
endmodule 