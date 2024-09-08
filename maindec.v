module maindic(
input [5:0]op,
output memtoreg,
output memwrite,
output alusrc,
output regdst,
output regwrite,
output branch,
output jump,
output[1:0]alu_op
);

reg [9:0] temp;
assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,alu_op}=temp;

always @(*) 
	begin 
	case (op)
		6'b000000:begin temp=10'b110000010; end
		6'b100011:begin temp=10'b101001000; end
		6'b101011:begin temp=10'b001010000; end
		6'b000100:begin temp=10'b000100001; end
		6'b001000:begin temp=10'b101000000; end
		6'b000010:begin temp=10'b000000100; end
		default : begin temp=10'b000000000; end
	endcase
	end

endmodule


