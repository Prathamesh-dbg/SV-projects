//----------------------------------------------------------------------------------------
// 									APB Master Agent
//----------------------------------------------------------------------------------------
typedef class apb_bus_env;
class apb_master_agent `APB_PARAM_DECL extends uvm_agent;
  
  apb_master_driver	`APB_PARAM_LIST	mstr_drv;
  apb_master_monitor `APB_PARAM_LIST	mstr_mon;
  apb_master_sequencer `APB_PARAM_LIST	mstr_seqr;
  
  virtual apb_bus_interface	`APB_PARAM_LIST	vif;
  
  apb_bus_env `APB_PARAM_LIST	penv;
  
  `uvm_component_utils(apb_master_agent `APB_PARAM_LIST)
  
  function new (string name="apb_master_agent", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	if(get_is_active() == UVM_ACTIVE)
	begin
		mstr_seqr = apb_master_sequencer	`APB_PARAM_LIST	::type_id::create("apb_mstr_seqr",this);
		mstr_drv = apb_master_driver	`APB_PARAM_LIST	::type_id::create("apb_mstr_drv",this);
	end
	mstr_mon = apb_master_monitor	`APB_PARAM_LIST	::type_id::create("apb_mstr_mon",this);
	
	if(!uvm_config_db#(virtual apb_bus_interface	`APB_PARAM_LIST	)::get(this,"","vif",vif))
		`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
	
  endfunction
  
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
	if(get_is_active() == UVM_ACTIVE)
		mstr_drv.seq_item_port.connect(mstr_seqr.seq_item_export);
  endfunction

endclass
