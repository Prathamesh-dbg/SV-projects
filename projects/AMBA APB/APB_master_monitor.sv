//----------------------------------------------------------------------------------------
// 									APB Master Monitor
//----------------------------------------------------------------------------------------
class apb_master_monitor `APB_PARAM_DECL extends uvm_monitor;

  virtual apb_bus_interface	`APB_PARAM_LIST	vif;
  apb_bus_configuration`APB_PARAM_LIST cfg;
  
  `uvm_component_utils(apb_master_monitor `APB_PARAM_LIST )
  
  function new (string name="apb_master_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	  `uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	  if(!uvm_config_db#(virtual apb_bus_interface	`APB_PARAM_LIST	)::get(this,"","vif",vif))
	  	`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction
  
  task run_phase(uvm_phase phase);
	`uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
  endtask

endclass
