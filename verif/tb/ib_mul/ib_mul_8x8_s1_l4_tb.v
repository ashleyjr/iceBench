`timescale 1ns/1ps

module ib_mul_8x8_s1_l4_tb;
 
   parameter   CLK_PERIOD = 20;
 
   reg            i_clk;
   reg            i_nrst;
   reg            i_start;
   reg   [7:0]    i_a;
   reg   [7:0]    i_b;
   wire  [15:0]   o_c;
   wire           o_done;

   ib_mul_8x8_s1_l4 u_mul_8x8_s1_l4 (
      .i_clk   (i_clk   ),
      .i_nrst  (i_nrst  ),
      .i_start (i_start ),
      .i_a     (i_a     ),
      .i_b     (i_b     ),
      .o_c     (o_c     ),
      .o_done  (o_done  )
   );

   initial begin
		while(1) begin
			#(CLK_PERIOD/2) i_clk = 0;
			#(CLK_PERIOD/2) i_clk = 1;
		end
	end

	initial begin
		$dumpfile("iceBench.vcd");
	   $dumpvars(0,ib_mul_8x8_s1_l4_tb); 	   
   end

   reg [15:0] check;

   initial begin
               i_start  = 0;
               i_a      = 0;
               i_b      = 0;
               i_nrst   = 1;
      #100     i_nrst   = 0;
      #100     i_nrst   = 1;


      i_a = 0;
      i_b = 0;
      repeat(256) begin
         repeat(256) begin
            check = i_a * i_b;
            @(negedge i_clk)  i_start = 1;
            @(negedge i_clk)  i_start = 0;
            while(!o_done) 
               @(posedge i_clk);
            if(check !== o_c) begin
               $display("ERROR");
               $finish();
            end
            i_b = i_b + 1;
         end
         i_a = i_a + 1;
      end
      $display("PASS");
      $finish();
   end

   initial begin
      repeat(1000000)
         @(posedge i_clk);
      $display("ERROR: TIMEOUT");
      $finish();
   end

endmodule
