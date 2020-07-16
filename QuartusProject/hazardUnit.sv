module hazardUnit(input  logic [4:0]  match, 
					   input  logic PCF, PCSrcW, RegWriteM, RegWriteW, MemtoRegE, BranchTakenE,
					   output logic [1:0]  forwardAE, forwardBE,
					   output logic stallD, stallF, flushD, flushE);		
				logic LDRstall;
				assign forwardAE = ( match[3] & RegWriteM ) ? 2'b10 :	
										 ( match[1] & RegWriteW ) ? 2'b01 :	
																			 2'b00 ;	
																	
				assign forwardBE = ( match[2] & RegWriteM ) ? 2'b10 :
										 ( match[0] & RegWriteW ) ? 2'b01 :
																			 2'b00 ;	
				assign LDRstall    = ( match[4] & MemtoRegE );			
				 
				
				assign stallD = LDRstall;							    		
				assign stallF = LDRstall | PCF;								
				assign flushE = LDRstall | BranchTakenE;					
				assign flushD = PCF | PCSrcW | BranchTakenE;							
endmodule 