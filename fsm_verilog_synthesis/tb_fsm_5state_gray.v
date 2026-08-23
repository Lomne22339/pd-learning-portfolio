module tb_fsm_5state_gray;
	reg clk, rst, in;
	wire [1:0] out;

	fsm_5state_gray uut (.clk(clk), .rst(rst), .in(in), .out(out));

	always #5 clk = ~clk;

	initial begin 
		clk = 0; rst =1; in = 0;
		#10;
		rst = 0;

		in = 0; #10; $display("state-driving in=%b out=%b", in, out);
                in = 0;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 1;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 1;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 0;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 0;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 1;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 0;	#10; $display("state-driving in=%b out=%b", in, out);
                in = 1;	#10; $display("state-driving in=%b out=%b", in, out);
	
		$finish;
	end
endmodule
