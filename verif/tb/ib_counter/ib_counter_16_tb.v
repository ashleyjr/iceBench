`timescale 1ns/1ps

module ib_counter_16_tb;
 
   parameter   CLK_PERIOD = 20;
 
   reg            i_clk;
   reg            i_nrst; 
   wire  [15:0]    o_c;

   ib_counter_16 u_counter_16 (
      .i_clk   (i_clk   ),
      .i_nrst  (i_nrst  ), 
      .o_c     (o_c     ) 
   );

   initial begin
		while(1) begin
			#(CLK_PERIOD/2) i_clk = 0;
			#(CLK_PERIOD/2) i_clk = 1;
		end
	end

	initial begin
		$dumpfile("iceBench.vcd");
	   $dumpvars(0,ib_counter_16_tb); 	   
   end

   reg [15:0] check;

   initial begin 
               i_nrst   = 1;
      #100     i_nrst   = 0;
      #100     i_nrst   = 1;
      #100000
      
      $display("PASS");
      $finish();
   end

   initial begin
      repeat(10000000)
         @(posedge i_clk);
      $display("ERROR: TIMEOUT");
      $finish();
   end

endmodule
