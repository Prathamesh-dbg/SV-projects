//----------------------------------------------------------------------------------------
// 									APB Bus Environment
//----------------------------------------------------------------------------------------
class apb_bus_env `APB_PARAM_DECL extends uvm_env;

  virtual apb_bus_interface `APB_PARAM_LIST vif;
  apb_master_agent `APB_PARAM_LIST	mstr_agent;
  apb_slave_agent	`APB_PARAM_LIST slv_agent;

  `uvm_component_utils(apb_bus_env `APB_PARAM_LIST )
  
  function new (string name="apb_bus_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	mstr_agent = apb_master_agent	`APB_PARAM_LIST	::type_id::create("mstr_agent",this);
	slv_agent = apb_slave_agent	`APB_PARAM_LIST	::type_id::create("slv_agent",this);
	
	if(!uvm_config_db#(virtual apb_bus_interface	`APB_PARAM_LIST	)::get(this,"","vif",vif))
		`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction
  
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
  endfunction

endclass
