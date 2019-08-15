module ib_mul_8x8_s1_l4(
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
 
   wire  [11:0]   ab_shift;
   wire  [11:0]   ab_add;

   wire  [7:0]    ab_acc_high_next;
   reg   [7:0]    ab_acc_high;
    
   wire  [3:0]    ab_acc_mid_next;
   reg   [3:0]    ab_acc_mid;
 
   reg   [3:0]    ab_acc_low;


   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) s <= 4'h0;
      else        s <= {s[2:0],i_start}; 
   end
      
   assign a  = (i_start | s[0]) ? i_a[3:0] : i_a[7:4];
   assign b  = (i_start | s[1]) ? i_b[3:0] : i_b[7:4];
                           
   assign ab = a * b;
 
   assign ab_shift = (s[2]) ? {ab, 4'h0} : {4'h0, ab};
   assign ab_add   = {ab_acc_high,ab_acc_mid} + ab_shift;

   assign ab_acc_high_next = (i_start) ? 8'h00 : ab_add[11:4];  

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst)       ab_acc_high <= 8'h00;
      else              ab_acc_high <= ab_acc_high_next;
   end
 
   assign ab_acc_mid_next = (i_start) ? ab[7:4] : ab_add[3:0];

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst)       ab_acc_mid <= 4'h0;
      else              ab_acc_mid <= ab_acc_mid_next;
   end

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst)       ab_acc_low <= 4'h0;
      else if(i_start)  ab_acc_low <= ab[3:0];
   end
   
   assign o_done = s[3];
   assign o_c    = {ab_acc_high,ab_acc_mid,ab_acc_low};

endmodule
