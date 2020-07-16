module decoder(input logic [0:31] 	Instr,
					output logic [3:0] 	op,
					output logic 		 	cond, RvD, RvS, 
					output logic [2:0] 	RnD, RnSA, RnSB,
					output logic [16:0] 	Imm );
	
	assign op 	= Instr[0:3];
	assign cond = Instr[4];
	assign RvD 	= Instr[5];
	assign RvS 	= Instr[6];
	assign RnD 	= Instr[7:9];
	assign RnSA = Instr[10:12];
	assign RnSB = Instr[13:15];
	assign Imm 	= Instr[15:31];

endmodule  