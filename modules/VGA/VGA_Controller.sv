module VGA_Controller(clk_VGA, HSync, VSync, Blank, x, y);

	input clk_VGA;
	output logic HSync, VSync, Blank;
	output logic [9:0] x = 10'b0;
	output logic [9:0] y = 10'b0;
	
	logic [9:0] HCounter = 10'b0;
	logic [9:0] VCounter = 10'b0;
	logic HSync_on, HSync_off, H_reset, HBlank_on;
	logic VSync_on, VSync_off, V_reset, VBlank_on;
	logic HBlank, VBlank;
	
	//total 793
	parameter HDISPLAY = 635;
	parameter HFRONT = 15;
	parameter HBACK = 48;
	parameter HSYNC = 95;
	parameter HMAX = HDISPLAY + HFRONT + HBACK + HSYNC;
	
	parameter VDISPLAY = 480;
	parameter VFRONT = 10;
	parameter VBACK = 33;
	parameter VSYNC = 2;
	parameter VMAX = VDISPLAY + VFRONT + VBACK + VSYNC;
	
	
	always_ff @(posedge clk_VGA)
	begin
		x <= x + 1;
		if (x == HMAX) begin
			x <= 0;
			y <= y + 1;
			if (y == VMAX) begin
				y <= 0;
			end
		end


	end
	
	always_ff @(posedge clk_VGA)
	begin
		if(HCounter == HMAX) begin
			HCounter <= 0;
			VCounter <= VCounter + 1;
			if (VCounter == VMAX)
				VCounter <= 0;
		end
			
		else
			HCounter <= HCounter + 1;
			
	
	end
	
	assign HSync = ~((HCounter >= HDISPLAY+HFRONT) & (HCounter < HDISPLAY+HFRONT+HSYNC));
	assign VSync = ~(VCounter >= VDISPLAY+VFRONT & VCounter < VDISPLAY+VFRONT+VSYNC);
	assign Blank = (HCounter < HDISPLAY) & (VCounter < VDISPLAY);


endmodule
