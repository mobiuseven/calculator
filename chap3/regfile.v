module regfile(q, d, rsel, wsel, we,  ck, res) ;
   output [15:0] q ;
   input [15:0]  d ;
   input [1:0] 	 rsel, wsel ;
   input 	 we, ck, res ;
   reg [15:0] 	 r0, r1, r2, r3 ;
   
   always @(posedge ck or negedge res)
     begin
	if(!res)
	  begin
	     {r0, r1, r2, r3} <= 64'd0 ;
	  end
	else if(!we)
	  begin
	     case(wsel)
	       2'd0: r0 <= d ;
	       2'd1: r1 <= d ;
	       2'd2: r2 <= d ;
	       2'd3: r3 <= d ;
	     endcase
	  end
     end // always @ (posedge ck or negedge res)
   
   assign q = (rsel == 2'd0) ? r0 :
	      (rsel == 2'd1) ? r1 :
	      (rsel == 2'd2) ? r2 :
	      (rsel == 2'd3) ? r3 : 16'bx ;
endmodule // regfile
