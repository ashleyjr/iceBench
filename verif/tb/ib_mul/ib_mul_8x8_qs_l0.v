`timescale 1ns/1ps

module ib_mul_8x8_qs_l0_tb;
   
   reg   [7:0]    i_a;
   reg   [7:0]    i_b;
   wire  [15:0]   o_c;

   ib_mul_8x8_qs_l0 u_mul_8x8_qs_l0 (
      .i_a  (i_a),
      .i_b  (i_b),
      .o_c  (o_c)
   );

	initial begin
		$dumpfile("iceBench.vcd");
	   $dumpvars(0,ib_mul_8x8_qs_l0_tb); 	   
   end

   reg [15:0] check;

   initial begin
      i_a = 0;
      i_b = 0;
      repeat(256) begin
         repeat(256) begin
            check = i_a * i_b;
            #100
            if(o_c != check) begin
               #100
               $display("FAIL");
               $finish();
            end
            #100
            i_b = i_b + 1;
         end
         i_a = i_a + 1;
      end
      $display("PASS");
      $finish();
   end

endmodule
