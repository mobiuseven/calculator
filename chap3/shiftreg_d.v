module shiftreg_c(out, in, ck, res) ;

   output out ;
   input  in, ck, res ;
   reg 	  q1, q2, q3 ;

   always @(posedge ck or negedge res)
     begin
	q1 = in ;
     end

   always @(posedge ck or negedge res)
     begin
	q2 = q1 ;
     end

   always @(posedge ck or negedge res)
     begin
	q3 = q2 ;
     end
   
   assign out = q3 ;
   
endmodule