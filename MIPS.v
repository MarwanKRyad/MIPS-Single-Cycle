module MIPS (
	input clk,    // Clock
	input rst,
	input [31:0] instr,
	input [31:0] read_mem_data,
	output [31:0] pc,
	output [31:0] data_mem_addr,
	output Mem_Write,
	output [31:0] write_mem_data

);
 
wire memtoreg,pcsrc,alusrc,regdst,regwrite,jump;
wire [2:0]alucontrol;
wire [5:0]op,funct;

wire zeroFlag;
controller cont_obj(op,funct,zeroFlag,memtoreg,Mem_Write,pcsrc,alusrc,regdst,regwrite,jump,alucontrol);


datapath data_obj(clk,rst,memtoreg,pcsrc,alusrc,regdst,regwrite,jump,alucontrol,read_mem_data,instr,pc,data_mem_addr,write_mem_data,zeroFlag,funct,op);

endmodule