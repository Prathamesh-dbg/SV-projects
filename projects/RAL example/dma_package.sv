package dma_pkg;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	import dma_ral_pkg::*;	
	
	`include "dma_seq_item.sv"
	`include "dma_driver.sv"
	`include "dma_sequencer.sv"
	`include "dma_monitor.sv"
	`include "dma_agent.sv"
	`include "dma_reg_seq.sv"
	`include "dma_adapter.sv"
	`include "dma_model_env.sv"
	
endpackage