module dataMemory(input logic clk, 
						input logic [15:0] address, 
						input logic [63:0] inputData, 
						input logic writeEnable, 
						output logic [63:0] out);
	
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



endmodule