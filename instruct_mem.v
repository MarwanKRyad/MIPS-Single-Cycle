module instruct_mem (
	input [31:0] pc,
	output[31:0] inst
);

reg [31:0] inst_mem[1023:0];

initial

$readmemh("memfile.dat",inst_mem);

assign inst=inst_mem[pc/4];

endmodule 