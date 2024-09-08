module ALU (
	input[31:0] A,
	input[31:0] B,
	input [2:0] opcode,
	output reg[31:0] C

	
);

  always@(*)
  begin
  		casex (opcode)
		3'b000: C=A&B;
		3'b001: C=A|B;
		3'b010: C=A+B;
		3'b110: C=A-B;
		3'b111: C=(A<B)?1:0 ;
		default: C=0;
       endcase
  end


endmodule 