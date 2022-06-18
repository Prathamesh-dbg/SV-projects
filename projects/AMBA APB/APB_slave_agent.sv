//----------------------------------------------------------------------------------------
// 									APB Slave Agent
//----------------------------------------------------------------------------------------
typedef class apb_bus_env;
class apb_slave_agent `APB_PARAM_DECL extends uvm_agent;
  
  apb_slave_driver	`APB_PARAM_LIST	slv_drv;
  //apb_slave_monitor	`APB_PARAM_LIST	slv_mon;
  apb_slave_sequencer`APB_PARAM_LIST	slv_seqr;
  
  virtual apb_bus_interface`APB_PARAM_LIST		vif;
  
  apb_bus_env `APB_PARAM_LIST			penv;

  `uvm_component_utils(apb_slave_agent `APB_PARAM_LIST)
  
  function new (string name="apb_slave_agent", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	if(get_is_active() == UVM_ACTIVE)
	begin
		slv_drv = apb_slave_driver `APB_PARAM_LIST::type_id::create("apb_slv_drv",this);
		slv_seqr = apb_slave_sequencer `APB_PARAM_LIST::type_id::create("apb_slv_seqr",this);
	end
	//slv_mon = apb_slave_monitor `APB_PARAM_LIST::type_id::create("apb_slv_mon",this);
	
	if(!uvm_config_db#(virtual apb_bus_interface `APB_PARAM_LIST)::get(this,"","vif",vif))
		`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction
  
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
	if(get_is_active() == UVM_ACTIVE)
		slv_drv.seq_item_port.connect(slv_seqr.seq_item_export);
  endfunction

endclass
