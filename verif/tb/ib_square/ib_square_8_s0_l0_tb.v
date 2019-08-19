`timescale 1ns/1ps

module ib_square_8_s0_l0_tb;
   
   reg   [7:0]    i_a;
   wire  [15:0]   o_c;

   ib_square_8_s0_l0 u_square_8_s0_l0 (
      .i_a  (i_a),
      .o_c  (o_c)
   );

	initial begin
		$dumpfile("iceBench.vcd");
	   $dumpvars(0,ib_square_8_s0_l0_tb); 	   
   end

   initial begin
      i_a = 0;
      repeat(256) begin 
         i_a = i_a + 1;
      end
      $display("PASS");
      $finish();
   end

endmodule
