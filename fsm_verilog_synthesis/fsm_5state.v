module fsm_5state (clk, rst, in, out);
	input clk, rst, in;
	output reg [1:0] out;

	parameter S1 = 5'b00001, S2 = 5'b00010, S3 = 5'b00100, S4 = 5'b01000, S5 = 5'b10000;
	reg [4:0] state, next_state;

	always @(posedge clk or posedge rst) begin
		if (rst)
			state<=S1;
		else
			state <= next_state;
	end

	always @(*) begin
		case (state)
			S1: next_state = (in == 0) ? S2 : S3;
			S2: next_state = (in == 0) ? S1	: S3;
			S3: next_state = (in == 0) ? S5	: S4;
			S4: next_state = (in == 0) ? S3	: S4;
			S5: next_state = (in == 0) ? S5	: S1;
			default: next_state = S1;
		endcase
	end

	always @(*) begin
		case (state)
			S1: out = (in == 0) ? 2'b01 : 2'b00;
			S2: out = (in == 0) ? 2'b11 : 2'b11;
			S3: out = (in == 0) ? 2'b01 : 2'b00;
			S4: out = (in == 0) ? 2'b11 : 2'b11;
			S5: out = (in == 0) ? 2'b00 : 2'b10;
			default: out = 2'b01;
		endcase
	end 
endmodule
