module memory(clk, address, inputData, writeEnable, out);

	// --- INPUT SIGNALS --- //
	input clk;
	input [15:0] address;
	input [63:0] inputData;
	input writeEnable;
	
	// --- OUTPUT SIGNALS --- //
	output logic [63:0] out;
	
	
	logic [63:0] mem [49151:0];
	
	initial begin
		$readmemh("C:/Users/juanp/Desktop/Arqui2/Proyecto_2/memory/Octave/hexImage3.txt", mem);
	end
	
	always_ff @(posedge clk) begin
		if(writeEnable) begin
			mem[address] <= inputData;
			out = inputData;
		end
		
		else out <= mem[address];
	
	
	end



endmodule