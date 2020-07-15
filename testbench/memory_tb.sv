`timescale 1ms/100ps
module memory_tb();

	logic clk;
	logic [15:0] address, addressB;
	logic [63:0] inputData, inputDataB;
	logic writeEnable, writeEnableB;
	logic [63:0] out, outB;
	
	memory DUT(clk, address, addressB, 
					inputData, inputDataB,
					writeEnable, writeEnableB,
					out, outB);
	
	
	initial begin
		clk = 0;
		writeEnable = 0;
		writeEnableB = 0;
		address = 16'b0;
		addressB = 16'b0;
		inputData = 64'b0;
		inputDataB = 64'b0;
		out = 64'b0;
		outB = 64'b0;
		
		//Read test PORT A
		#10 address = 16'b01;
		#5 assert(out == 64'h0e0e0e0e0f0f0f0f)
				$display("Correct value at address %0d", address);
		
		#10 address = 16'b0100;
		#5 assert(out == 64'h0f0f0f0f0e0e0e0e)
				$display("Correct value at address %0d", address);
		
		#10 address = 16'b0101;
		#5 assert(out == 64'h0e0f0f0f0f0f0f0e)
				$display("Correct value at address %0d", address);
		
		#10 address = 16'h05fff;
		#5 assert(out == 64'hcdcbc7cbd1bcc9cc)
				$display("Correct value at address %0d", address);
		
		//Write test PORT A on address 0
		#10 address = 16'b00;
		inputData = 64'h00ff;
		$display("Writing %0h on address %0d of PORT A", inputData, address);
		writeEnable = 1;
		
		#10 writeEnable = 0;
		#5 assert(out == 64'h00ff)
				$display("Correct value at address %0d", address);
				
		//Read test on both PORTS
		#10 address = 64'h07;
		addressB = 64'h0a;
		#5 assert(out == 64'h0e0e0e0e0c0c0c0c)
				$display("Correct value at address %0d on PORT A", address);
			assert(outB == 64'h0b0b0b0b090b0b0d)
				$display("Correct value at address %0d on PORT B", addressB);
		
		#10 $stop;	
	
	end
	
	always #1 clk = ~clk;


endmodule