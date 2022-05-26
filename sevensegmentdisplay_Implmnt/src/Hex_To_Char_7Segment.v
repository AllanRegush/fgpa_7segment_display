module Hex_To_Char_7Segment
(input i_Clk,
 input [7:0] i_Binary_Num,
 output       o_Segment_A,
 output       o_Segment_B,
 output       o_Segment_C,
 output       o_Segment_D,
 output       o_Segment_E,
 output       o_Segment_F,
 output       o_Segment_G);

 reg [6:0] r_Hex_Encoding = 7'h00;

 always @(posedge i_Clk)
   begin
    case (i_Binary_Num)
      8'h48 : r_Hex_Encoding <= 7'h37; // H
      8'h45 : r_Hex_Encoding <= 7'h4F; // E
      8'h4C : r_Hex_Encoding <= 7'h0E; // L
      8'h4F : r_Hex_Encoding <= 7'h7E; // O
      default : r_Hex_Encoding <= 7'h00;
    endcase
  end

 assign o_Segment_A = r_Hex_Encoding[6];
 assign o_Segment_B = r_Hex_Encoding[5];
 assign o_Segment_C = r_Hex_Encoding[4];
 assign o_Segment_D = r_Hex_Encoding[3];
 assign o_Segment_E = r_Hex_Encoding[2];
 assign o_Segment_F = r_Hex_Encoding[1];
 assign o_Segment_G = r_Hex_Encoding[0];

endmodule


