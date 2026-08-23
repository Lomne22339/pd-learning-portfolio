module tb_fsm_5state;
	reg clk, rst, in;
	wire [1:0] out;

	fsm_5state uut (.clk(clk), .rst(rst), .in(in), .out(out));
	//waveform dump setup
	initial begin
		$dumpfile("fsm5_waveform.vcd");
		$dumpvars(0, tb_fsm_5state);
	end

	//clock generation
	always #5 clk = ~clk;

	initial begin
		clk = 0; rst = 1; in = 0;
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
