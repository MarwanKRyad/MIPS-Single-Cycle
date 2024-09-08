module mux2x1 #(parameter bit_size=32) 
	(
	input [bit_size-1:0] a,    
	input [bit_size-1:0] b, 
	input select,
	output [bit_size-1:0] c 
	);

assign c=(select==1)?b:a;

endmodule 