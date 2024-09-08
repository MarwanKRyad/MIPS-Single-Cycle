module system_tb ();
	reg clk;
	reg rst;
	wire write_enable;
	wire[31:0] data_bus;
	wire[31:0] address_bus;

 top_module_test DUT(clk,rst,data_bus,address_bus,write_enable);
integer i;
 initial begin
	clk=0;
	i=0;
	rst=1;
	#22;
	rst=0;
	forever
	#5 clk=~clk;
 end

always @(negedge clk ) 
	begin
	if(write_enable)
		begin
			
		
	if(data_bus==7 && address_bus==84)
	 begin
		 $display("simulation is correct");
		 $stop;
	end
	else if(address_bus!=80)
		begin
		$display("simulation is failed");
		 $stop;
		end
	end

	i=i+1;
	if(i==50)
		$stop;
end
endmodule 