//--------------------------
//Example to illustrate case/casex/casez
//--------------------------
module test;

function void test_casez(logic [2:0] irq);
  logic int0, int1, int2;
  int0=0;
  int1=0;
  int2=0;
  casez (irq) 
    3'b1zx : int2 = 1'b1;
    3'b?1z : int1 = 1'b1;
    3'bx?1 : int0 = 1'b1;
  endcase 
  $display("int0=%b int1=%b int2=%b",int0,int1,int2);
endfunction

function void test_casex(logic [2:0] irq);
  logic int0, int1, int2;
  int0=0;
  int1=0;
  int2=0;
  casex (irq) 
    3'b1xz : int2 = 1'b1;
    3'b?1x : int1 = 1'b1;
    3'bx?1 : int0 = 1'b1;
  endcase 
  $display("int0=%b int1=%b int2=%b",int0,int1,int2);
endfunction


initial	begin
	$display("CASEZ starting");
	test_casez(3'b11x);
	test_casez(3'b110);
	test_casez(3'bx01);
	
	
	$display("CASEX starting");
	test_casex(3'b101);
	test_casex(3'b01z);
	test_casex(3'b001);
end

endmodule
