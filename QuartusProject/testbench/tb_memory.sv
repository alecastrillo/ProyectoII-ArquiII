`timescale 1ms/100ps
module memory_tb();

	logic clk;
	logic [15:0] address;
	logic [63:0] inputData;
	logic writeEnable;
	logic [63:0] out;
	
	memory DUT(clk, address, inputData, writeEnable, out);
	
	
	initial begin
		clk = 0;
		writeEnable = 0;
		address = 16'b0;
		inputData = 64'b0;
		out = 64'b0;
		
		#10 address = 16'b01;
		
		#10 address = 16'b0100;
		
		#10 address = 16'b0101;
		
		#10 address = 16'h05fff;
		
		//Write test on address 0
		#10 address = 16'b00;
		inputData = 64'h00ff;
		writeEnable = 1;
		
		#10 writeEnable = 0;
		
		#10 $stop;	
	
	end
	
	always #1 clk = ~clk;


endmodule