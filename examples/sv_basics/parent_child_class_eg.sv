//-----------------
// Basic parent child class example
//-----------------
class Packet;
  bit [31:0] addr;
  bit err=0;
  function int get_addr();
  //virtual function int get_addr();
	addr = 'hABCD;
    //get_addr = 'hABCD;
	return addr;
  endfunction

endclass

class ErrPacket extends Packet; 
  bit err=1;
  function int get_addr();
    //get_addr = 'hCDEF;
	addr = 'hCDEF;
	return addr;
  endfunction
endclass

module test;
  initial begin
    Packet p;
    ErrPacket  ep;  
    ep = new();
    p = ep;
    $display("packet addr=%h err=%b", p.get_addr, p.err);
    $display("ep_packet addr=%h err=%b", ep.get_addr, ep.err);
  end  
endmodule
