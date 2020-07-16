module dataMemory(clk, address, addressB,
				  inputData, inputDataB, 
				  writeEnable, writeEnableB,
				  out, outB);

	// --- INPUT SIGNALS --- //
	input clk;
	input [15:0] address, addressB;
	input [63:0] inputData, inputDataB;
	input writeEnable, writeEnableB;
	
	// --- OUTPUT SIGNALS --- //
	output logic [63:0] out, outB;
	
	
	logic [63:0] mem [49151:0];
	
	initial begin
		$readmemh("hexImage3.txt", mem);
	end
	
	always_ff @(posedge clk) begin
		if(writeEnable) begin
			mem[address] <= inputData;
			out = inputData;
		end
		
		else out <= mem[address];
	end
	
	always_ff @(posedge clk) begin
		if(writeEnableB) begin
			mem[addressB] <= inputDataB;
			outB = inputDataB;
		end
		
		else outB <= mem[addressB];
	end
	


endmodule


//module dataMemory(input logic clk, 
//						input logic [15:0] address, 
//						input logic [63:0] inputData, 
//						input logic writeEnable, 
//						output logic [63:0] out);
//	
//	logic [63:0] mem [49151:0];
//	
//	initial begin
//		$readmemh("hexImage3.txt", mem);
//	end
//	
//	always_ff @(posedge clk) begin
//		if(writeEnable) begin
//			mem[address] <= inputData;
//			out = inputData;
//		end
//		
//		else out <= mem[address];
//	
//	
//	end
//
//
//
//endmodule