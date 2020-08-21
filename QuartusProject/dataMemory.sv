<<<<<<< HEAD
module dataMemory(input logic clk, 
						input logic [15:0] address, 
						input logic [63:0] inputData, 
						input logic writeEnable, 
						input logic save,
						output logic doneSaving,
						output logic [63:0] out);
=======
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
	
>>>>>>> 30ec9eb94316bbb60b4bc83dc25cfd4ed91d32e8
	
	logic [63:0] mem [15450:0];
	
	initial begin
		$readmemh("hexImage3.txt", mem); 
	end
	
	assign out = mem[address];
	
	always @ (posedge save)
	begin
		$writememh("hexImage3.txt", mem);
		doneSaving <= 1;
	end
	
	always_comb begin 
		if(writeEnable) begin
			mem[address] <= inputData;
<<<<<<< HEAD
	end 
=======
			out = inputData;
		end
		
		else out <= mem[address];
	end
>>>>>>> 30ec9eb94316bbb60b4bc83dc25cfd4ed91d32e8
	
	always_ff @(posedge clk) begin
		if(writeEnableB) begin
			mem[addressB] <= inputDataB;
			outB = inputDataB;
		end
		
		else outB <= mem[addressB];
	end
	


<<<<<<< HEAD
endmodule 
=======
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
>>>>>>> 30ec9eb94316bbb60b4bc83dc25cfd4ed91d32e8
