//----------------------------------------------------------------------------------------
// 									APB Master Monitor
//----------------------------------------------------------------------------------------
class apb_master_monitor `APB_PARAM_DECL extends uvm_monitor;

  `uvm_component_utils(apb_master_monitor `APB_PARAM_LIST )
  
  function new (string name="apb_master_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
  endfunction
  
  task run_phase(uvm_phase phase);
	`uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
  endtask

endclass
