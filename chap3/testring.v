module testring ;
   wire y ;
   reg 	c ;

   initial
     begin
	c <= 0 ;

	#10
	  c <= 1 ;

	#10
	  $finish ;
     end

   ring inst0(y,c) ;
   
endmodule