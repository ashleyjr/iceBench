module ib_mul_8x8_s0_l16(
   input    wire           i_clk,
   input    wire           i_nrst,
   input    wire           i_start,
   input    wire  [7:0]    i_a,
   input    wire  [7:0]    i_b,
   output   wire  [15:0]   o_c,
   output   wire           o_done
);

   wire           upd_ptr;
   reg   [3:0]    ptr;
   wire  [1:0]    a_ptr;
   wire  [1:0]    b_ptr;

   wire           a0;
   wire           a1;
   wire           a2;
   wire           a3;

   wire           b0;
   wire           b1;
   wire           b2;
   wire           b3;

   wire  [1:0]    a;
   wire  [1:0]    b;
   wire  [3:0]    ab;

   wire  [5:0]    ab0;
   wire  [7:0]    ab1;
   wire  [9:0]    ab2;
   wire  [11:0]   ab3;
   wire  [13:0]   ab4; 
   wire  [15:0]   ab5;
   
   wire  [15:0]   ab_acc_next;
   reg   [15:0]   ab_acc;

   reg            done;
   reg            run;

   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)       run <= 1'b0;
      else if(i_start)  run <= 1'b1;
      else if(o_done )  run <= 1'b0;
   end
  
   assign upd_ptr = (run | i_start) & ~done;

   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)       ptr <= 4'h0;
      else if(upd_ptr)  ptr <= ptr + 4'h1; 
   end
   
   assign a_ptr = ptr[1:0];
   assign b_ptr = ptr[3:2];

   assign a0 = (a_ptr == 2'b00);
   assign a1 = (a_ptr == 2'b01);
   assign a2 = (a_ptr == 2'b10);
   assign a3 = (a_ptr == 2'b11);

   assign b0 = (b_ptr == 2'b00);
   assign b1 = (b_ptr == 2'b01);
   assign b2 = (b_ptr == 2'b10);
   assign b3 = (b_ptr == 2'b11);

   assign a  = (a0) ? i_a[1:0] : 
               (a1) ? i_a[3:2] :
               (a2) ? i_a[5:4] :
                      i_a[7:6] ;
   
   assign b  = (b0) ? i_b[1:0] : 
               (b1) ? i_b[3:2] :
               (b2) ? i_b[5:4] :
                      i_b[7:6] ; 
   assign ab = a * b;

   assign ab0 = (a1 | a2 | a3 ) ? (ab << 2 ) : ab;
   assign ab1 = (a2 | a3      ) ? (ab0 << 2) : ab0;
   assign ab2 = (a3           ) ? (ab1 << 2) : ab1; 
   assign ab3 = (b1 | b2 | b3 ) ? (ab2 << 2) : ab2; 
   assign ab4 = (b2 | b3      ) ? (ab3 << 2) : ab3; 
   assign ab5 = (b3           ) ? (ab4 << 2) : ab4; 
   
   assign ab_acc_next = (i_start) ? ab : (ab_acc + ab5);

   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst) ab_acc <= 16'h0000;
      else        ab_acc <= ab_acc_next;
   end
   
   always@(posedge i_clk or negedge i_nrst) begin
	   if(!i_nrst) done <= 1'b0;
      else        done <= (ptr == 4'hf);
   end
   
   assign o_done = done;
   assign o_c    = ab_acc;

endmodule
