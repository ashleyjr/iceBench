module ib_counter_16(
   input    wire           i_clk,
   input    wire           i_nrst,
   output   wire  [15:0]   o_c
);

   wire  [15:0] count_next;
   reg   [15:0] count;

   assign count_next = count + 'd1;

   always@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) count <= 'd0;
      else        count <= count_next; 
   end
  
   assign o_c = count;

endmodule
