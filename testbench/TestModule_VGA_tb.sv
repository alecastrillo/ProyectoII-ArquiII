`timescale 1ms/100ps
module TestModule_VGA_tb();

	logic clk_FPGA, clk_VGA;
	logic [1:0] channel;
	logic [7:0] R, G, B;
	logic HSync, VSync, Blank, Sync;
	
	TestModule_VGA DUT(clk_FPGA, clk_VGA, R, G, B, HSync, VSync, Blank, Sync, channel);
	
	initial begin
		clk_FPGA = 0;
		clk_VGA = 0;
		HSync = 0;
		VSync = 0;
		Blank = 0;
		Sync = 0;
		channel = 2'b0;
	
	end
	
	always #1 clk_FPGA = ~clk_FPGA;
	

endmodule
