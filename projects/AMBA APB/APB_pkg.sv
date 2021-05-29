//----------------------------------------------------------------------------------------
// 									APB PKG
//----------------------------------------------------------------------------------------
package APB_pkg;
	import uvm_pkg::*;
	`include "uvm_macros.svh"

	`include "APB_common_definitions.sv"
	`include "APB_seq_item.sv"
	`include "APB_bus_configuration.sv"
	`include "APB_master_driver.sv"
	`include "APB_master_sequencer.sv"
	`include "APB_master_monitor.sv"
	`include "APB_master_agent.sv"
	`include "APB_slave_driver.sv"
	`include "APB_slave_sequencer.sv"
	`include "APB_slave_monitor.sv"
	`include "APB_slave_agent.sv"
	`include "APB_bus_environment.sv"
	`include "APB_sequences.sv"
  
endpackage
