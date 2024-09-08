module register_file (
	input clk,    // Clock
	input rst,
	input WE3,
	input[4:0] A1,
	input[4:0] A2,
	input[4:0] A3,
	output [31:0] RD1,
	output [31:0] RD2,
	input [31:0] WD3
);

reg[31:0]reg_file[7:0];
integer i;
assign RD1=(A1!=0)? reg_file[A1]:0;
assign RD2=(A2!=0)? reg_file[A2]:0;

always @(posedge clk or posedge rst) 
	begin 
	if(rst) 
	begin
	
	for (i = 0; i < 8; i=i+1) 
		reg_file[i]<=0;
	end 

	else if(WE3==1)
	
		reg_file[A3]<=WD3;
	
end

endmodule 