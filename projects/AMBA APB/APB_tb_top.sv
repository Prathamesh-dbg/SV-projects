//----------------------------------------------------------------------------------------
// 									APB TB TOP
//----------------------------------------------------------------------------------------
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "APB_pkg.sv"
`include "APB_bus_interface.sv"

module TB_TOP;
	import uvm_pkg::*;
	import APB_pkg::*;
  `include "APB_test.sv"
  
	bit clk,reset;
	
  always
    #5 clk = ~clk;

	initial
	begin
	  reset=0;
    #100 reset=1;
    //#500 $finish();
	end

	apb_bus_interface	`APB_PARAM_LIST apb_if	(clk,reset);

	initial
		run_test();
	
  initial
	  uvm_config_db#(virtual apb_bus_interface	`APB_PARAM_LIST	)::set(uvm_root::get(),"*","vif",apb_if);
	  	
	
endmodule
