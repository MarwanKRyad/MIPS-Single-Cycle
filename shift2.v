module shift2 (
	input [31:0] A,    // Clock
	output [31:0] shifted
	
);

assign shifted=A<<2;
endmodule 