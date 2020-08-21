module dataMemory(input logic clk, 
						input logic [15:0] address, 
						input logic [63:0] inputData, 
						input logic writeEnable, 
						input logic save,
						output logic doneSaving,
						output logic [63:0] out);
	
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
	end 
	
	always_ff @(posedge clk) begin
		if(writeEnableB) begin
			mem[addressB] <= inputDataB;
			outB = inputDataB;
		end
		
		else outB <= mem[addressB];
	end

endmodule 
