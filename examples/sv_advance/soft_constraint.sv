class packet;
  rand bit [3:0] addr;
  //constraint addr_range { addr > 6; }		//This constraint causes conflict with inline constraint in the test
  constraint addr_range { soft addr > 10; }	//soft constraint allows constraint overriding
endclass
 
module test;
  initial begin
    packet pkt;
    pkt = new();
 
    repeat(2) begin
      pkt.randomize() with { addr < 10;};
      $display("\taddr = %0d",pkt.addr);
    end
  end
endmodule