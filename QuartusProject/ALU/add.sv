module add (input logic [15:0] 	a, b, 
				input logic 			cin,
				output logic [15:0] 	s, 
				output logic 			cout);
	
   assign {cout, s} = a + b + cin;
	
endmodule 