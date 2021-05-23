//---------------------------------------------------------------
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "dma_ral_pkg.sv"
`include "dma_package.sv"

// INCLUDING INTERFACE AND TESTCASE FILES
`include "dma_if.sv"

module tbench_top;
	import uvm_pkg::*;
	import dma_pkg::*;
	
	`include "dma_test.sv"
	`include "DMA_rtl.v"
  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  dma_if intf(clk,reset);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  DMA DUT (
    .clk		(intf.clk	),
    .reset		(intf.reset	),
    .addr		(intf.addr	),
    .wr_en		(intf.wr_en	),
    .valid		(intf.valid	),
    .wdata		(intf.wdata	),
    .rdata		(intf.rdata	)
   );
  
  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual dma_if)::set(uvm_root::get(),"*","vif",intf);
    //enable wave dump
    //$dumpfile("dump.vcd"); 
    //$dumpvars;
  end
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test();
  end
  
endmodule