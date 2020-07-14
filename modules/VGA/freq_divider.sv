module freq_divider(clk_FPGA, clk_VGA);

	input clk_FPGA;
	output logic clk_VGA;
	
	logic counter = 0;
	
	always_ff @(posedge clk_FPGA)
	begin
		counter <= ~counter;
		
	
	end
	
	assign clk_VGA = counter;

endmodule
