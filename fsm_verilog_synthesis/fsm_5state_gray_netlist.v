/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP4
// Date      : Sun Aug 23 17:13:36 2026
/////////////////////////////////////////////////////////////


module fsm_5state_gray ( clk, rst, in, out );
  output [1:0] out;
  input clk, rst, in;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [2:0] state;
  wire   [2:0] next_state;

  HS65_LH_DFPRQX4 \state_reg[0]  ( .D(next_state[0]), .CP(clk), .RN(n1), .Q(
        state[0]) );
  HS65_LH_DFPRQX4 \state_reg[1]  ( .D(next_state[1]), .CP(clk), .RN(n1), .Q(
        state[1]) );
  HS65_LH_DFPRQX4 \state_reg[2]  ( .D(next_state[2]), .CP(clk), .RN(n1), .Q(
        state[2]) );
  HS65_LH_IVX9 U3 ( .A(rst), .Z(n1) );
  HS65_LH_NAND2X7 U22 ( .A(n4), .B(n3), .Z(n8) );
  HS65_LH_IVX9 U23 ( .A(n11), .Z(n4) );
  HS65_LH_IVX9 U24 ( .A(state[2]), .Z(n3) );
  HS65_LH_OAI21X3 U25 ( .A(in), .B(n11), .C(n13), .Z(next_state[1]) );
  HS65_LH_OAI21X3 U26 ( .A(in), .B(state[1]), .C(n3), .Z(n13) );
  HS65_LH_IVX9 U27 ( .A(state[0]), .Z(n6) );
  HS65_LH_NOR3X4 U28 ( .A(n5), .B(in), .C(n12), .Z(next_state[2]) );
  HS65_LHS_XOR2X6 U29 ( .A(n6), .B(state[2]), .Z(n12) );
  HS65_LH_IVX9 U30 ( .A(state[1]), .Z(n5) );
  HS65_LH_CBI4I6X5 U31 ( .A(state[0]), .B(in), .C(n14), .D(state[2]), .Z(
        next_state[0]) );
  HS65_LH_NAND2X7 U32 ( .A(in), .B(n5), .Z(n14) );
  HS65_LH_NAND2X7 U33 ( .A(state[1]), .B(n6), .Z(n11) );
  HS65_LH_OAI112X5 U34 ( .A(n6), .B(n3), .C(n8), .D(n9), .Z(out[0]) );
  HS65_LH_AOI12X2 U35 ( .A(n7), .B(n3), .C(n10), .Z(n9) );
  HS65_LH_IVX9 U36 ( .A(in), .Z(n7) );
  HS65_LH_AOI12X2 U37 ( .A(n3), .B(n6), .C(state[1]), .Z(n10) );
  HS65_LH_AO312X9 U38 ( .A(n5), .B(n3), .C(state[0]), .D(in), .E(n4), .F(n2), 
        .Z(out[1]) );
  HS65_LH_IVX9 U39 ( .A(n8), .Z(n2) );
endmodule

