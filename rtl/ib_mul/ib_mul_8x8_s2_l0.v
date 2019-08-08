module ib_mul_8x8_s2_l0(
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c
);

   wire  [3:0] a0;
   wire  [3:0] a1;
   wire  [3:0] a2;
   wire  [3:0] a3;

   wire  [3:0] b0;
   wire  [3:0] b1;
   wire  [3:0] b2;
   wire  [3:0] b3;

   wire  [3:0] c0;
   wire  [3:0] c1;
   wire  [3:0] c2;
   wire  [3:0] c3;
   
   wire  [3:0] d0;
   wire  [3:0] d1;
   wire  [3:0] d2;
   wire  [3:0] d3;

   assign a0 = i_a[1:0] * i_b[1:0];
   assign a1 = i_a[1:0] * i_b[3:2];
   assign a2 = i_a[1:0] * i_b[5:4];
   assign a3 = i_a[1:0] * i_b[7:6];
   
   assign b0 = i_a[3:2] * i_b[1:0];
   assign b1 = i_a[3:2] * i_b[3:2];
   assign b2 = i_a[3:2] * i_b[5:4];
   assign b3 = i_a[3:2] * i_b[7:6];
   
   assign c0 = i_a[5:4] * i_b[1:0];
   assign c1 = i_a[5:4] * i_b[3:2];
   assign c2 = i_a[5:4] * i_b[5:4];
   assign c3 = i_a[5:4] * i_b[7:6];
   
   assign d0 = i_a[7:6] * i_b[1:0];
   assign d1 = i_a[7:6] * i_b[3:2];
   assign d2 = i_a[7:6] * i_b[5:4];
   assign d3 = i_a[7:6] * i_b[7:6];
    
   assign o_c =               (b3 << 8) + (c3 << 10) + (d3 << 12) +
                  (a3 << 6) + (b2 << 6) + (c2 << 8 ) + (d2 << 10) +
                  (a2 << 4) + (b1 << 4) + (c1 << 6 ) + (d1 << 8 ) +
                  (a1 << 2) + (b0 << 2) + (c0 << 4 ) + (d0 << 6 ) +
                   a0;

endmodule
