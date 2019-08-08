module ib_mul_8x8_s1_l0(
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c
);

   wire  [7:0] a;
   wire  [7:0] b;
   wire  [7:0] c;
   wire  [7:0] d;

   assign a = i_a[3:0] * i_b[3:0];
   assign b = i_a[3:0] * i_b[7:4];
   assign c = i_a[7:4] * i_b[3:0];
   assign d = i_a[7:4] * i_b[7:4];
   
   assign o_c = (d << 8) + (c << 4) + (b << 4) + a;

endmodule
