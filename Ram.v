module Ram (
	input clk,    // Clock
	input rst,
	input [31:0] addr,
	input [31:0] data_in,
	input write_enable,
	output [31:0] data_out
	
);

reg [31:0] mem[1023:0];
integer i;

assign data_out=mem[addr];

always @(posedge clk or posedge rst ) 
	begin
	if(rst) 
	begin
		for (i = 0; i < 1024; i=i+1) 
		begin
			mem[i]<=0;
		end
	end

	else
	 begin
	 	if(write_enable==1)
		 mem[addr]<=data_in;
	  end
end

endmodule 