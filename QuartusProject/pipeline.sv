module pipeline();
	
	logic clk, reset;
	logic GET8_D, PCSrc_D, ScalarWrite_D, VectorWrite_D, HistogramWrite_D, MemtoReg_D, MemWrite_D, Branch_D,HistSrc_D, FlagWrite_D, ImmSrc_D, VectorOrHistogram_D;
	logic [2:0] ALUControl_D, LaneControl_D;
	logic [15:0] PC, PCPlus4, PC_IN, Imm;
	logic [31:0] InstrF;
	
	logic enable, enable_FtoD, FlushD, cond;
	logic [3:0] op;
	logic RvD, RvS;
	logic [2:0] RnD, RnSA, RnSB;
	logic [31:0] InstrD;
	logic [7:0] V8bit, RhD;
	logic [15:0] RnDA_D,RnDB_D;
	logic [63:0] RhD_HRF, RvD_VRF, RvDA_D;
	
	logic GET8_E, PCSrc_E, ScalarWrite_E, VectorWrite_E, HistogramWrite_E, MemtoReg_E, MemWrite_E, Branch_E, FlagsW_E, FlagWrite_E, ImmSrc_E;
	logic [15:0] RnDA_E, RnDB_E, SrcB;
	logic [63:0] RvDA_E;
	logic [7:0] RhD_E;
	logic RvD_E;
	logic [2:0] RnD_E; 
	logic [2:0] ALUControl_E, LaneControl_E;
	logic [15:0] Imm_D, Imm_E;
	logic [15:0] ALUResult_E;
	logic [63:0] LanesResult, LanesResult_E; 
	
	logic Flush_M;
	logic PCSrc_M, ScalarWrite_M, VectorWrite_M, HistogramWrite_M, MemtoReg_M, MemWrite_M;
	logic [15:0] ALUResult_M;
	logic [63:0] LanesResult_M;
	logic [7:0] RhD_M;
	logic RvD_M;
	logic [2:0] RnD_M;
	logic [63:0] DataFromMem_M;
	
	logic PCSrc_W, ScalarWrite_W, VectorWrite_W, HistogramWrite_W, MemtoReg_W;
	logic [15:0] ALUResult_W;
	logic [63:0] LanesResult_W;
	logic [7:0] RhD_W;
	logic RvD_W;
	logic [2:0] RnD_W;
	logic [63:0] Res_W;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////// FETCH ///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
	
	mux_pc	 					mux_pc (PCPlus4, ALUResult_W, PCSrc_W, PC_IN);
	
	PCREG 						PCREG (clk, reset, enable,PC_IN,PC); // enable from HU
		
	adder 						adder (PC ,16'b100,PCPlus4);
	
	instructionMemory 		instructionMemory(PC, InstrF);
	 
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pipe_FtoD					pipe_FtoD (clk, reset, enable_FtoD, FlushD, InstrF, InstrD);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////// DECODE///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	decoder						decoder (InstrD, op, cond, RvD, RvS, RnD, RnSA, RnSB, Imm);
	
	controlUnit					controlUnit (op, cond, GET8_D, PCSrc_D, ScalarWrite_D, VectorWrite_D, HistogramWrite_D, MemtoReg_D, MemWrite_D, Branch_D,
													 HistSrc_D, FlagWrite_D, ImmSrc_D, VectorOrHistogram_D, ALUControl_D, LaneControl_D);
	
	scalarRegisterFile		scalarRegisterFile (clk,ScalarWrite_W,RnSA,RnSB,RnD,ALUResult_W,PCPlus4,RnDA_D,RnDB_D); // r7?
	
	vectorRegisterFile		vectorRegisterFile (clk,VectorWrite_W,RvS,RvD,Res_W,RvD_VRF);
	 
	mux_vector					mux_vector (RvD_VRF,Imm[2:0],V8bit);  
	
	mux_HSrc						mux_HSrc (RnDA_D[7:0],V8bit,HistSrc_D,RhD);  
	
	histogramRegisterFile	histogramRegisterFile(clk,HistogramWrite_W,GET8_D,RhD[5:0],RhD_W[5:0],RvD_VRF,Res_W,RhD_HRF);
	
	mux_VorH 					mux_VorH (RhD_HRF, RvD_VRF,VectorOrHistogram_D,RvDA_D); 
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	pipe_DtoE					pipe_DtoE(clk,reset,enable, FlushE, 
												 GET8_D, PCSrc_D, ScalarWrite_D, VectorWrite_D, HistogramWrite_D, MemtoReg_D, MemWrite_D, Branch_D, 
												 LaneControl_D, FlagsW_D,FlagWrite_D,ALUControl_D,ImmSrc_D,Imm,RnDA_D, RnDB_D, RvDA_D,RhD,RvD,RnD,
												 GET8_E, PCSrc_E, ScalarWrite_E, VectorWrite_E, HistogramWrite_E, MemtoReg_E, MemWrite_E, Branch_E, 
												 LaneControl_E, FlagsW_E,FlagWrite_E,ALUControl_E,ImmSrc_E,Imm_E,RnDA_E, RnDB_E, RvDA_E,RhD_E,RvD_E,RnD_E);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////// EXECUTE//////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	mux_ImmSrc 					mux_ImmSrc (RnDB_E, Imm_E,ImmSrc_E,SrcB);
	
	ALU							ALU (RnDA_E, SrcB,ALUControl_E,FlagsW_D,ALUResult_E); // Evaluate cond bnp //FLAGS
	
	LANES 						LANES (LaneControl_E, RvDA_E,SrcB,RhD_E[7:6],LanesResult);	
	
	mux_GET8 					mux_GET8 (LanesResult,RvDA_E,GET8_E, LanesResult_E);
			  
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	pipe_EtoM					pipe_EtoM (clk,reset,enable, Flush_M, // hazard unit 
												  PCSrc_E , ScalarWrite_E, VectorWrite_E, HistogramWrite_E, MemtoReg_E, MemWrite_E,ALUResult_E, LanesResult_E,
												  RhD_E,RvD_E,RnD_E,
												  PCSrc_M, ScalarWrite_M, VectorWrite_M, HistogramWrite_M, MemtoReg_M, MemWrite_M,ALUResult_M, LanesResult_M,
												  RhD_M,RvD_M,RnD_M);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////// MEMORY //////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	dataMemory					dataMemory (clk, ALUResult_M, LanesResult_M, MemWrite_M, DataFromMem_M);
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pipe_MtoW					pipe_MtoW (clk, reset,enable, FlushW, // hazard unit 
												  PCSrc_M, ScalarWrite_M, VectorWrite_M, HistogramWrite_M, MemtoReg_M,
												  ALUResult_M,DataFromMem_M,LanesResult_M, RhD_M,	RvD_M,RnD_M,
												  PCSrc_W, ScalarWrite_W, VectorWrite_W, HistogramWrite_W, MemtoReg_W,
												  ALUResult_W,DataFromMem_W, LanesResult_W, RhD_W,RvD_W,RnD_W);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////// WRITEBACK ///////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	mux_WB 						mux_WB (DataFromMem_W, LanesResult_W,MemtoReg_W,Res_W);
	 

	always 
		begin  
			clk <= 1; 
			# 5;
			clk <= 0; 
			# 5;
		end
	initial 
		begin
			#5;
			reset <=1;
			#5;
			reset<=0; 
			
		end 
					
endmodule 