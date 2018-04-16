module t1_regfile ;
   wire [1:0] rsel, wsel ;
   wire [15:0] d, r_out0, r_out1, r_out2, r_out3, q ;
   reg 	      ck, res, we ;
   initial
     begin
	$display("                 time ck res r_out0 r_out1 r_out2 r_out3") ;
	$monitor("%t, %b, %b, %d, %d, %d, %d", $time, ck, res, r_out0 ,r_out1, r_out2, r_out3) ;
	ck <= 0 ;
	res <= 1 ;
	#10
	  res <= 0;
	#350
	  $finish ;
     end

   always #10
     begin
	ck <= ~ck ;
     end

   regfile inst0 (q, d, rsel, wsel, we, ck, res, r_out0 ,r_out1, r_out2, r_out3) ;
   
endmodule