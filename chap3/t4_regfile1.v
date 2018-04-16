module t4_regfile1 ;
   wire [1:0] rsel, wsel ;
   wire [15:0] d, r_out0, r_out1, r_out2, r_out3, q ;
   reg 	      ck, res, we ;

   assign wsel = 2'bxx ;
   assign d = 16'h4c55 ;
   assign rsel = 2'b00 ;
   
   initial
     begin
	$display("                 time ck res r_out0 r_out1 r_out2 r_out3 q") ;
	$monitor("%t, %b, %b, %d, %d, %d, %d, %d", $time, ck, res, r_out0 ,r_out1, r_out2, r_out3, q) ;
	ck <= 0 ;
	res <= 0 ;
	we <= 0 ;
	//we <= 1 ;
	#10
	  res <= 1;
	#350
	  $finish ;
     end

   always #10
     begin
	ck <= ~ck ;
     end

   regfile1 inst0 (q, d, rsel, wsel, we, ck, res, r_out0 ,r_out1, r_out2, r_out3) ;
   
endmodule