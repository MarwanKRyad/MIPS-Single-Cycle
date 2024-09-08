 module controller(
 input [5:0]op,funct,
 input zero,
 output memtoreg,memwrite,
 output pcsrc,alusrc,
 output regdst,regwrite,
 output jump,
 output[2:0]alucontrol
 );

wire [1:0] alu_op;
wire branch;

maindic m(op,memtoreg,memwrite,alusrc,regdst,regwrite,branch,jump,alu_op);
aludec  a(alu_op,funct,alucontrol);

assign pcsrc =branch&zero;




endmodule 