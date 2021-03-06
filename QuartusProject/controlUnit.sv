module controlUnit(input logic [3:0] op,
						 input logic cond,
						 output logic GET8, PCSrc, ScalarWrite, VectorWrite, HistogramWrite, MemtoReg, MemWrite, Branch, HistSrc, FlagWrite, ImmSrc, VectorOrHistogram,
						 output logic [2:0] ALUControl,
						 output logic [2:0] LaneControl);
	always_comb
	case(op)
		4'b1110: // MOV
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			1;
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0; //
				ImmSrc <= 				1; 
				VectorOrHistogram <= 	0; 
				ALUControl <= 			3'b100; 
				LaneControl <= 			3'b111;
			end 
		4'b0001: // INC
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			1; 
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b001;
				LaneControl <= 			3'b111;
			end
		4'b0010:	// ADD
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			1;
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				1; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b000;
				LaneControl <= 			3'b111;
			end
		4'b0011: // CMP
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b010;
				LaneControl <= 			3'b111;
			end
		4'b0100: // B
			begin
				GET8 <= 					0;
				PCSrc <= 					1; // ? 
				ScalarWrite <= 			1; // PC?
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				1; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				1; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b100;
				LaneControl <= 			3'b111;
			end
		4'b0101: // BNQ
			begin
				GET8 <= 					0;
				PCSrc <= 					1; // ?
				ScalarWrite <= 			0; // PC?
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				1; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				1; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b101;
				LaneControl <= 			3'b111;
			end
		4'b0110: // LOAD_8X8
			begin
				GET8 <= 					0;
				PCSrc <= 					0;
				ScalarWrite <= 			0;
				VectorWrite <= 			1;
				HistogramWrite <= 		0; 
				MemtoReg <= 				1;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b111;
			end
		4'b0111:	// STORE_8X8
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				1;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b111;
			end
		4'b1000: // MODS_8X8
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			1;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b11;
				LaneControl <= 			3'b111;
			end
		4'b1001: // INC1_4X16
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		1;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	1;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b100;
			end
		4'b1010: // NORM_4X16
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		1;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				1;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	1;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b000;
			end
		4'b1011: // MULS_4X16
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		1;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b010;
			end
		4'b1100: // GET8X8
			begin 
				GET8 <= 					1;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			1;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	1;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b111;
			end
	default: 	// DEFAULT
			begin
				GET8 <= 					0;
				PCSrc <= 					0; 
				ScalarWrite <= 			0;
				VectorWrite <= 			0;
				HistogramWrite <= 		0;
				MemtoReg <= 				0;
				MemWrite <= 				0;
				Branch <= 				0; 
				HistSrc <= 				0;
				FlagWrite <= 			0;
				ImmSrc <= 				0; 
				VectorOrHistogram <= 	0;
				ALUControl <= 			3'b011;
				LaneControl <= 			3'b111;
			end
	endcase
						 
endmodule 