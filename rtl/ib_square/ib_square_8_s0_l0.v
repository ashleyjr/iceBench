module ib_square_8_s0_l0(
   input    wire  [7:0]    i_a, 
   output   wire  [15:0]   o_c
);

   assign o_c = i_a * i_a;

endmodule
