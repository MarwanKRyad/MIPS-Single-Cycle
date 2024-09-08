module DFF (
	input clk,    
	input rst, 
	input [31:0] d,
	output reg[31:0] q
	
);

always @(posedge clk or posedge rst) 
	begin 
	if(rst)
		 q<=0;
	else 
		 q<=d;
	end

endmodule