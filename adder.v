module adder (
	input [31:0]a,    // Clock
	input [31:0]b, // Clock Enable
	output [31:0]c  // Asynchronous reset active low
	
);

assign c=a+b;


endmodule