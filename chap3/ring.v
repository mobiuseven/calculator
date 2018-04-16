module ring(y,c);
   output y ;
   input  c ;

   assign y = c & (~y) ;
   
endmodule