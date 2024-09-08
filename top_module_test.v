module top_module_test (
	input clk,
	input rst,
	output[31:0] data_bus,
	output[31:0] address_bus,
	output write_enable
);


wire [31:0] instr,pc,data_mem_to_cpu;


instruct_mem inst_obj(pc,instr);

Ram ram_obj(clk,rst,address_bus,data_bus,write_enable,data_mem_to_cpu);

MIPS MIPS_obj(clk,rst,instr,data_mem_to_cpu,pc,address_bus,write_enable,data_bus);
endmodule 