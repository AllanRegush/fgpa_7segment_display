module Project_7_Segment_Top
 (input i_Clk,
  input i_Switch_2,
  output o_Segment2_A,
  output o_Segment2_B,
  output o_Segment2_C,
  output o_Segment2_D,
  output o_Segment2_E,
  output o_Segment2_F,
  output o_Segment2_G);

  wire w_Switch_2;
  reg  r_Switch_2 = 1'b0;
  reg [7:0] r_Ascii_Value = 8'h00;
  reg [3:0] r_Count = 0;
  wire w_Segment2_A;
  wire w_Segment2_B;
  wire w_Segment2_C;
  wire w_Segment2_D;
  wire w_Segment2_E;
  wire w_Segment2_F;
  wire w_Segment2_G;

  Debounce_Switch Debounce_Switch_Inst
  (.i_Clk(i_Clk),
   .i_Switch(i_Switch_2),
   .o_Switch(w_Switch_2));

  always @(posedge i_Clk)
    begin 
      r_Switch_2 <= w_Switch_2;
      if (w_Switch_2 == 1'b1 && r_Switch_2 == 1'b0)
        begin
          case(r_Count)
            0:
              begin
                r_Ascii_Value <= 8'h48;
                r_Count <= r_Count + 1;
              end
            1:
              begin
                r_Ascii_Value <= 8'h45;
                r_Count <= r_Count + 1;
              end
            2:
              begin
                r_Ascii_Value <= 8'h4C;
                r_Count <= r_Count + 1;
              end
            3:
              begin
                r_Ascii_Value <= 8'h4C;
                r_Count <= r_Count + 1;
              end
            4:
              begin
                r_Ascii_Value <= 8'h4F;
                r_Count <= r_Count + 1;
              end
            5:
              begin
                r_Ascii_Value <= 8'h00;
                r_Count <= 0;
              end
          endcase
        end
    end
   
   Hex_To_Char_7Segment Inst
   (.i_Clk(i_Clk),
    .i_Binary_Num(r_Ascii_Value),
    .o_Segment_A(w_Segment2_A),
    .o_Segment_B(w_Segment2_B),
    .o_Segment_C(w_Segment2_C),
    .o_Segment_D(w_Segment2_D),
    .o_Segment_E(w_Segment2_E),
    .o_Segment_F(w_Segment2_F),
    .o_Segment_G(w_Segment2_G));
   
   assign o_Segment2_A = ~w_Segment2_A;
   assign o_Segment2_B = ~w_Segment2_B;
   assign o_Segment2_C = ~w_Segment2_C;
   assign o_Segment2_D = ~w_Segment2_D;
   assign o_Segment2_E = ~w_Segment2_E;
   assign o_Segment2_F = ~w_Segment2_F;
   assign o_Segment2_G = ~w_Segment2_G;
endmodule
   
   
   
   
   