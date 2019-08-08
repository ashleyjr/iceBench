module ib_mul_8x8_s0_l0(
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c
);

   assign o_c = i_a * i_b;

endmodule
