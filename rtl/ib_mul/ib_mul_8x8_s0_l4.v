module ib_mul_8x8_s0_l4(
   input    wire           i_clk,
   input    wire           i_nrst,
   input    wire           i_start,
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c,
   output   wire           o_done
);
     
   reg   [3:0]    s;

   wire  [3:0]    a;
   wire  [3:0]    b;
   wire  [7:0]    ab;

   wire  [15:0]   ab_plus_stg0;
   wire  [15:0]   ab_plus_stg1;
   wire  [15:0]   ab_acc_next;
   reg   [15:0]   ab_acc;

   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) s <= 4'h0;
      else        s <= {s[2:0],i_start}; 
   end
      
   assign a  = (i_start | s[0]) ? i_a[3:0] : i_a[7:4];
   assign b  = (i_start | s[1]) ? i_b[3:0] : i_b[7:4];
                           
   assign ab = a * b;

   assign ab_plus_stg0 = (ab << 4);
   assign ab_plus_stg1 = (s[2]) ? (ab_plus_stg0 << 4) : ab_plus_stg0;

   assign ab_acc_next = (i_start) ? ab : (ab_acc + ab_plus_stg1);

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst) ab_acc <= 16'h0000;
      else        ab_acc <= ab_acc_next;
   end
   
   assign o_done = s[3];
   assign o_c    = ab_acc;

endmodule
