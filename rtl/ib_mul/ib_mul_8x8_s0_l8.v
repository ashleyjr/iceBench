module ib_mul_8x8_s0_l8(
   input    wire           i_clk,
   input    wire           i_nrst,
   input    wire           i_start,
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c,
   output   wire           o_done
);
      
   reg   [7:0]    a;
   wire  [7:0]    a_next; 

   reg   [15:0]   b;
   wire  [15:0]   b_next; 

   wire  [15:0]   b_plus_c; 
  
   wire           c_upd;
   reg   [15:0]   c;
   wire  [15:0]   c_next; 

   assign a_next = (i_start) ? i_a : a >> 1;

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst) a <= 16'h0000;
      else        a <= a_next;
   end

   assign b_next = (i_start) ? {8'h00, i_b} : b << 1;

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst) b <= 16'h0000;
      else        b <= b_next;
   end

   assign b_plus_c   = b + c;
   assign c_upd      = i_start | a[0];
   assign c_next     = (a[0]) ? b_plus_c:
                                16'h0000;

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst)    c <= 16'h0000;
      else if(c_upd) c <= c_next;
   end

   assign o_c     = c;
   assign o_done  = ~i_start & (a == 8'h00);

endmodule
