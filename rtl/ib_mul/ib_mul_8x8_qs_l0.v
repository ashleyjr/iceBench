module ib_mul_8x8_qs_l0(
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c
);
   wire [8:0] a;
   wire [7:0] t;
   wire [7:0] b;
   wire [7:0] d;
   
   wire        m;

   wire [17:0] a2;
   wire [15:0] b2;

   wire [15:0] as;
   wire [13:0] bs;
  
   assign m    = (i_a > i_b);

   assign a    = (i_a + i_b);
   
   assign m    = (i_a > i_b);       // Difference
   assign t    = (m) ? i_a : i_b;
   assign b    = (m) ? i_b : i_a;
   assign d    = t - b;

   assign a2   = a * a;
   assign b2   = d * d;

   assign as   = a2 >> 2;
   assign bs   = b2 >> 2;

   assign o_c  = as - bs;

endmodule
