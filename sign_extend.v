module sign_extend (
	input[15:0] A,    
	output[31:0] extend
	
);

assign extend={{16{A[15]}},A[15:0]};

endmodule 