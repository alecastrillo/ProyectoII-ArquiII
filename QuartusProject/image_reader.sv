module image_reader(clk_FPGA, clk_VGA, x, y, R, G, B, addressB, outB, channel);

	// --- INPUT SIGNALS --- //
	input clk_FPGA;
	input clk_VGA;
	input [1:0] channel;
	input [9:0] x, y;
	input [63:0] outB;
	
	// --- OUTPUT SIGNALS ---//
	output logic [7:0] R, G, B;
	output logic [15:0] addressB;
	
	logic [3:0] count;
	logic [7:0] pix1, pix2, pix3, pix4, pix5, pix6, pix7, pix8;
	logic [7:0] channelValue;
	
	//Pixels on a single memory address
	assign pix8 = outB[7:0];
	assign pix7 = outB[15:8];
	assign pix6 = outB[23:16];
	assign pix5 = outB[31:24];
	assign pix4 = outB[39:32];
	assign pix3 = outB[47:40];
	assign pix2 = outB[55:48];
	assign pix1 = outB[63:56];
	//assign channelValue = outB[(count*8)-1:((count-1)*8)];
	
	/* Assign the RGB values to the VGA outputs
	 *
	 */
	always_ff @(posedge clk_VGA) begin
		if((x<0 | x>256) | (y<0 | y>256)) begin
			R = 8'b0;
			G = 8'b0;
			B = 8'b0;
			count <= 0;
		end
	
		
		else begin	
			R = channelValue;
			G = channelValue;
			B = channelValue;
			count <= count + 1;
		end
		
		if(count > 4'b111)
			count <= 4'h1;
		
	end
	
	
	/* Calculate the memory address based on 
	 * the current X and Y of the VGA Controller
	 */
	always_ff @(posedge clk_FPGA) begin	
		case(channel)
			2'b00: addressB = ((y*256 + x) / 8) + 24576; //Red 
			2'b01: addressB = ((y*256 + x) / 8) + 32768; //Green
			2'b10: addressB = ((y*256 + x) / 8) + 40960; //Blue
		endcase
	end
	
	
	/* Assign the corresponding pixel value
	 *	to the channel value register
	 */
	always_ff @(posedge clk_FPGA) begin
		case(count)
			4'h1: channelValue = pix1;
			4'h2: channelValue = pix2;
			4'h3: channelValue = pix3;
			4'h4: channelValue = pix4;
			4'h5: channelValue = pix5;
			4'h6: channelValue = pix6;
			4'h7: channelValue = pix7;
			4'h8: channelValue = pix8;
			default: channelValue = 8'b0;
		endcase
	end

endmodule
