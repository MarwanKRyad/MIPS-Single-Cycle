module datapath (
	input clk,    // Clock
	input rst,
	input memtoreg,
 	input pcsrc,alusrc,
 	input regdst,regwrite,
 	input jump,
 	input[2:0]alucontrol,
 	input [31:0] reg_file_from_mem,
 	input [31:0] instr,
 	output [31:0] pc_val,
 	output [31:0] ALU_Result,
	output [31:0] mem_write_data,
	output zero_flag,
	output [5:0] funct, 
	output [5:0] op_code
);
wire [31:0] PCPLUS4;
adder pc_4(pc_val,4,PCPLUS4);
wire[31:0] PCBranch;
wire[31:0] pc_d;
mux2x1 #(.bit_size(32)) mux_pc(PCPLUS4,PCBranch,pcsrc,pc_d);

wire [31:0] jump_address;
//shift2 jumb_shifter(instr[25:0],jump_address);
assign jump_address={PCPLUS4[31:28],instr[25:0],2'b00};
wire [31:0] pc_dff;

mux2x1 #(.bit_size(32)) pc_input(pc_d,jump_address,jump,pc_dff);

DFF pc_dff_obj(clk,rst,pc_dff,pc_val);
wire [31:0] SignImm;
sign_extend sign_ex(instr[15:0],SignImm);
wire [31:0] SignImmx4;

shift2 inst_numx4(SignImm,SignImmx4);



adder pc_brunch(SignImmx4,PCPLUS4,PCBranch);


wire [4:0] write_into_reg;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] WD3;

register_file regs (clk,rst,regwrite,instr[25:21],instr[20:16],write_into_reg,RD1,RD2,WD3);

mux2x1 #(.bit_size(5)) mux_pc_reg_file(instr[20:16],instr[15:11],regdst,write_into_reg);

mux2x1 #(.bit_size(32)) write_reg_input(ALU_Result,reg_file_from_mem,memtoreg,WD3);




wire [31:0] SRCB;

mux2x1 #(.bit_size(32)) SRCB_mux(RD2,SignImm,alusrc,SRCB);


ALU ALU_cpu(RD1,SRCB,alucontrol,ALU_Result);





assign zero_flag=(ALU_Result==0)?1:0;

assign op_code=instr[31:26];

assign funct=instr[5:0];

assign mem_write_data=RD2;




endmodule 