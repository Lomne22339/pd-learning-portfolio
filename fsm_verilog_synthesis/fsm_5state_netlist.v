/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP4
// Date      : Sun Aug 23 16:22:43 2026
/////////////////////////////////////////////////////////////


module fsm_5state ( clk, rst, in, out );
  output [1:0] out;
  input clk, rst, in;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [4:0] state;
  wire   [4:0] next_state;

  HS65_LH_DFPSQX4 \state_reg[0]  ( .D(next_state[0]), .CP(clk), .SN(n1), .Q(
        state[0]) );
  HS65_LH_DFPRQX4 \state_reg[1]  ( .D(next_state[1]), .CP(clk), .RN(n1), .Q(
        state[1]) );
  HS65_LH_DFPRQX4 \state_reg[2]  ( .D(next_state[2]), .CP(clk), .RN(n1), .Q(
        state[2]) );
  HS65_LH_DFPRQX4 \state_reg[3]  ( .D(next_state[3]), .CP(clk), .RN(n1), .Q(
        state[3]) );
  HS65_LH_DFPRQX4 \state_reg[4]  ( .D(next_state[4]), .CP(clk), .RN(n1), .Q(
        state[4]) );
  HS65_LH_IVX9 U3 ( .A(rst), .Z(n1) );
  HS65_LH_IVX9 U34 ( .A(n20), .Z(n2) );
  HS65_LH_NAND2X7 U35 ( .A(n7), .B(n3), .Z(n20) );
  HS65_LH_IVX9 U36 ( .A(n14), .Z(n5) );
  HS65_LHS_XNOR2X6 U37 ( .A(state[0]), .B(n6), .Z(n9) );
  HS65_LH_OAI112X5 U38 ( .A(n8), .B(n3), .C(n22), .D(n23), .Z(next_state[0])
         );
  HS65_LH_AOI212X4 U39 ( .A(state[1]), .B(n8), .C(state[3]), .D(n9), .E(n5), 
        .Z(n23) );
  HS65_LHS_XOR2X6 U40 ( .A(n2), .B(n24), .Z(n22) );
  HS65_LH_NOR2X6 U41 ( .A(state[3]), .B(n9), .Z(n24) );
  HS65_LH_IVX9 U42 ( .A(state[2]), .Z(n6) );
  HS65_LH_IVX9 U43 ( .A(state[4]), .Z(n3) );
  HS65_LH_IVX9 U44 ( .A(state[3]), .Z(n4) );
  HS65_LH_NOR3X4 U45 ( .A(n18), .B(state[4]), .C(state[2]), .Z(next_state[2])
         );
  HS65_LH_AOI32X5 U46 ( .A(n19), .B(n4), .C(in), .D(n15), .E(state[3]), .Z(n18) );
  HS65_LHS_XNOR2X6 U47 ( .A(n7), .B(state[0]), .Z(n19) );
  HS65_LH_IVX9 U48 ( .A(state[1]), .Z(n7) );
  HS65_LH_NOR4ABX2 U49 ( .A(n2), .B(in), .C(state[0]), .D(n17), .Z(
        next_state[3]) );
  HS65_LHS_XNOR2X6 U50 ( .A(state[2]), .B(state[3]), .Z(n17) );
  HS65_LH_NAND2X7 U51 ( .A(state[2]), .B(state[0]), .Z(n14) );
  HS65_LH_NOR3X4 U52 ( .A(state[0]), .B(state[1]), .C(in), .Z(n15) );
  HS65_LH_NOR3AX2 U53 ( .A(state[0]), .B(n20), .C(n21), .Z(next_state[1]) );
  HS65_LH_NAND3X5 U54 ( .A(n6), .B(n4), .C(n8), .Z(n21) );
  HS65_LH_NOR3AX2 U55 ( .A(n15), .B(state[3]), .C(n16), .Z(next_state[4]) );
  HS65_LHS_XNOR2X6 U56 ( .A(state[2]), .B(state[4]), .Z(n16) );
  HS65_LH_IVX9 U57 ( .A(in), .Z(n8) );
  HS65_LH_NOR3X4 U58 ( .A(n9), .B(n5), .C(n10), .Z(out[1]) );
  HS65_LH_AOI22X6 U59 ( .A(n11), .B(n4), .C(state[3]), .D(n2), .Z(n10) );
  HS65_LH_OAI32X5 U60 ( .A(n3), .B(state[1]), .C(n8), .D(state[4]), .E(n7), 
        .Z(n11) );
  HS65_LH_NAND4ABX3 U61 ( .A(n12), .B(state[1]), .C(n4), .D(n13), .Z(out[0])
         );
  HS65_LH_AOI12X2 U62 ( .A(state[4]), .B(n14), .C(n9), .Z(n12) );
  HS65_LH_OAI21X3 U63 ( .A(state[4]), .B(n8), .C(n9), .Z(n13) );
endmodule

