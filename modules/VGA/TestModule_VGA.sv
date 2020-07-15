module TestModule_VGA(clk_FPGA, clk_VGA, R, G, B, HSync, VSync, Blank, Sync, channel);

	// --- INPUT SIGNALS --- //
	input clk_FPGA;
	input [1:0] channel;
	
	// --- OUTPUT SIGNALS --- //
	output logic clk_VGA;
	output logic HSync, VSync, Blank, Sync;
	output logic [7:0] R, G, B;
	
	// --- INTERNAL --- //
	
	//VGA
	logic [9:0] x, y;
	
	//Memory
	logic [15:0] address, addressB;
	logic [63:0] inputData, inputDataB;
	logic writeEnable, writeEnableB;
	logic [63:0] out, outB;
	
	freq_divider freq_divider(clk_FPGA, clk_VGA);
	VGA_Controller VGA_Controller(clk_VGA, HSync, VSync, Blank, x, y);
	image_reader image_reader(clk_FPGA, clk_VGA, x, y, R, G, B, addressB, outB, channel);
	
	memory memory(clk_FPGA, address, addressB, 
				inputData, inputDataB,
				writeEnable, writeEnableB,
				out, outB);
	
	
	initial begin
		x = 10'b0;
		y = 10'b0;
		writeEnable = 0;
		writeEnableB = 0;
		address = 16'b0;
		addressB = 16'b0;
		inputData = 64'b0;
		inputDataB = 64'b0;
		out = 64'b0;
		outB = 64'b0;
	end
	


endmodule
