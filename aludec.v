module aludec(
input[1:0] alu_op,
input [5:0] funct,
output reg [2:0] alucontrol
);

always @(*) 
	begin 
	
	if(alu_op==2'b00)
	   alucontrol=3'b010;

	else if(alu_op==2'b01)
	   alucontrol=3'b110;
	else
		begin
			if(funct==6'b100000)
				alucontrol=3'b010;
			else if (funct==6'b100010)
				alucontrol=3'b110;
			else if (funct==6'b100100)
				alucontrol=3'b000;
			else if (funct==6'b100101)
				alucontrol=3'b001;
			else if (funct==6'b101010)
				alucontrol=3'b111;
			else
				alucontrol=3'b000;
		end
		

	end


endmodule