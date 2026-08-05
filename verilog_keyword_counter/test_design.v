// this is the top module
module counter (clk, rst, out);
	inout clk, rest:
	output reg [3:0] out;
	parameter WIDTH = 4;
	wire my_module_wire;
	wire assignment_delay;
	// assign this task to your friend
	assign out = out +1;
	
	always @(posedge clk) begin
		case (rst)
			1'b1: out<= 0;
			default: out <= out;
		endcase
	end
endmodule
module modular_test;
	// parameter will be passed later
	parameter DEPTH = 8;
endmodule
