module ib_mul_8x8_s3_l0(
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c
);
  
   wire [7:0] a;
   wire [7:0] b;
   wire [7:0] c;
   wire [7:0] d;
   wire [7:0] e;
   wire [7:0] f;
   wire [7:0] g;
   wire [7:0] h;
   
   assign a[0] = i_a[0] & i_b[0];
   assign a[1] = i_a[0] & i_b[1];
   assign a[2] = i_a[0] & i_b[2];
   assign a[3] = i_a[0] & i_b[3];
   assign a[4] = i_a[0] & i_b[4];
   assign a[5] = i_a[0] & i_b[5];
   assign a[6] = i_a[0] & i_b[6];
   assign a[7] = i_a[0] & i_b[7];
   
   assign b[0] = i_a[1] & i_b[0];
   assign b[1] = i_a[1] & i_b[1];
   assign b[2] = i_a[1] & i_b[2];
   assign b[3] = i_a[1] & i_b[3];
   assign b[4] = i_a[1] & i_b[4];
   assign b[5] = i_a[1] & i_b[5];
   assign b[6] = i_a[1] & i_b[6];
   assign b[7] = i_a[1] & i_b[7];
   
   assign c[0] = i_a[2] & i_b[0];
   assign c[1] = i_a[2] & i_b[1];
   assign c[2] = i_a[2] & i_b[2];
   assign c[3] = i_a[2] & i_b[3];
   assign c[4] = i_a[2] & i_b[4];
   assign c[5] = i_a[2] & i_b[5];
   assign c[6] = i_a[2] & i_b[6];
   assign c[7] = i_a[2] & i_b[7];
   
   assign d[0] = i_a[3] & i_b[0];
   assign d[1] = i_a[3] & i_b[1];
   assign d[2] = i_a[3] & i_b[2];
   assign d[3] = i_a[3] & i_b[3];
   assign d[4] = i_a[3] & i_b[4];
   assign d[5] = i_a[3] & i_b[5];
   assign d[6] = i_a[3] & i_b[6];
   assign d[7] = i_a[3] & i_b[7];
   
   assign e[0] = i_a[4] & i_b[0];
   assign e[1] = i_a[4] & i_b[1];
   assign e[2] = i_a[4] & i_b[2];
   assign e[3] = i_a[4] & i_b[3];
   assign e[4] = i_a[4] & i_b[4];
   assign e[5] = i_a[4] & i_b[5];
   assign e[6] = i_a[4] & i_b[6];
   assign e[7] = i_a[4] & i_b[7];
  
   assign f[0] = i_a[5] & i_b[0];
   assign f[1] = i_a[5] & i_b[1];
   assign f[2] = i_a[5] & i_b[2];
   assign f[3] = i_a[5] & i_b[3];
   assign f[4] = i_a[5] & i_b[4];
   assign f[5] = i_a[5] & i_b[5];
   assign f[6] = i_a[5] & i_b[6];
   assign f[7] = i_a[5] & i_b[7];
   
   assign g[0] = i_a[6] & i_b[0];
   assign g[1] = i_a[6] & i_b[1];
   assign g[2] = i_a[6] & i_b[2];
   assign g[3] = i_a[6] & i_b[3];
   assign g[4] = i_a[6] & i_b[4];
   assign g[5] = i_a[6] & i_b[5];
   assign g[6] = i_a[6] & i_b[6];
   assign g[7] = i_a[6] & i_b[7];
   
   assign h[0] = i_a[7] & i_b[0];
   assign h[1] = i_a[7] & i_b[1];
   assign h[2] = i_a[7] & i_b[2];
   assign h[3] = i_a[7] & i_b[3];
   assign h[4] = i_a[7] & i_b[4];
   assign h[5] = i_a[7] & i_b[5];
   assign h[6] = i_a[7] & i_b[6];
   assign h[7] = i_a[7] & i_b[7];
   
   assign o_c =                                                                                          (h[7] << 14) +  
                                                                                          (g[7] << 13) + (h[6] << 13) +  
                                                                           (f[7] << 12) + (g[6] << 12) + (h[5] << 12) +
                                                            (e[7] << 11) + (f[6] << 11) + (g[5] << 11) + (h[4] << 11) +
                                             (d[7] << 10) + (e[6] << 10) + (f[5] << 10) + (g[4] << 10) + (h[3] << 10) +
                               (c[7] << 9) + (d[6] << 9 ) + (e[5] << 9 ) + (f[4] << 9 ) + (g[3] << 9 ) + (h[2] << 9 ) +
                 (b[7] << 8) + (c[6] << 8) + (d[5] << 8 ) + (e[4] << 8 ) + (f[3] << 8 ) + (g[2] << 8 ) + (h[1] << 8 ) +
   (a[7] << 7) + (b[6] << 7) + (c[5] << 7) + (d[4] << 7 ) + (e[3] << 7 ) + (f[2] << 7 ) + (g[1] << 7 ) + (h[0] << 7 ) +
   (a[6] << 6) + (b[5] << 6) + (c[4] << 6) + (d[3] << 6 ) + (e[2] << 6 ) + (f[1] << 6 ) + (g[0] << 6 ) +
   (a[5] << 5) + (b[4] << 5) + (c[3] << 5) + (d[2] << 5 ) + (e[1] << 5 ) + (f[0] << 5 ) +
   (a[4] << 4) + (b[3] << 4) + (c[2] << 4) + (d[1] << 4 ) + (e[0] << 4 ) +
   (a[3] << 3) + (b[2] << 3) + (c[1] << 3) + (d[0] << 3 ) +
   (a[2] << 2) + (b[1] << 2) + (c[0] << 2) +
   (a[1] << 1) + (b[0] << 1) +
    a[0];

endmodule
