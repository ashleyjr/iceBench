module ib_mul_8x8_qs_l1(
   input    wire           i_clk,
   input    wire           i_nrst,
   input    wire           i_start,
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c,
   output   wire           o_done
);

   reg            s;

   wire           mux;
   wire  [8:0]    a;
   wire  [7:0]    t;
   wire  [7:0]    b;
   wire  [7:0]    d;
   
   wire  [8:0]    m;
   wire  [17:0]   sq;
   wire  [15:0]   sq_s;

   reg   [15:0]   c;
   wire  [15:0]   c_next;
   
   assign a  = (i_a + i_b);
   
   
   assign mux  = (i_a > i_b);
   assign t  = (mux) ? i_a : i_b;
   assign b  = (mux) ? i_b : i_a;
   assign d  = (t - b);

   assign m    = (i_start) ? a : {1'b0,d}; 
   assign sq   = (m * m);
   assign sq_s = sq >> 2;

   assign c_next = (i_start) ? sq_s : (c - sq_s);

   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) c <= 16'h0000;
      else        c <= c_next; 
   end
 
   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) s <= 1'b0;
      else        s <= i_start; 
   end

   assign o_done = s;
   assign o_c    = c_next;
 
endmodule
