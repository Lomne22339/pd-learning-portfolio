module DFF (D, CP, Q);
	input D, CP;
	output reg Q;

	always @(posedge CP)
		begin 
		Q <= D;
	end
endmodule
	
	
module top (a, b, clk, out);
        input a, b, clk;
        output out;

         wire n1_out;	   // N1's output, feeds q1_reg.D
         wire clk_buf;      // C1->C2 buffered clock, feeds all 3 DFF clocks
         wire c1_out;       // C1's output, feeds C2's input
         wire q1_q;         // q1_reg.Q
         wire q2_q;         // q2_reg.Q
         wire n2_out;       // N2's output (NOT of q2_q)
         wire a1_out;       // A1's output, feeds out_reg.D
         wire outreg_q;      // out_reg.Q
	
        not (n1_out, a);
        not (c1_out, clk);
        not (clk_buf, c1_out);

	DFF q1_reg (.D(n1_out), .CP(clk_buf), .Q(q1_q));
	DFF q2_reg (.D(b), .CP(clk_buf), .Q(q2_q));
	DFF out_reg (.D(a1_out), .CP(clk_buf), .Q(outreg_q));
	not (n2_out, q2_q);
	and (a1_out, q1_q, n2_out);
	not (out, outreg_q);
endmodule
