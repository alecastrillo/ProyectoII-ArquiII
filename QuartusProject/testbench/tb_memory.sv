module tb_memory();

	logic clk;
	logic [15:0] address;
	logic [63:0] inputData;
	logic writeEnable;
	logic [63:0] out;
	
	dataMemory DUT(clk, address, inputData, writeEnable, out);
	
	
	initial 
	begin
		clk = 0;
		writeEnable = 0;
		address = 16'b0;
		inputData = 64'b0;
		out = 64'b0;
		
		#10; 
		address = 16'b00;
		#10;
		address = 16'b0100;
		#10; 
		address = 16'b0110;
		#10 
		address = 16'h05fff;
		#10;
		address = 16'b00;
		inputData = 64'h00ff;
		writeEnable = 1; 
		#10; 
		address = 16'b00;
		#10;
		writeEnable = 0;
		#10;
		$stop;	
	
	end
	
	always #5 clk = ~clk;


endmodule