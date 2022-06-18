//----------------------------------------------------------------------------------------
// 									APB Slave Memory 
//----------------------------------------------------------------------------------------
class apb_slave_memory `APB_PARAM_DECL extends uvm_component;

  uvm_analysis_imp #(apb_trans `APB_PARAM_LIST ) trans_in;
  uvm_analysis_port #(apb_trans `APB_PARAM_LIST ) trans_out;

  logic [APB_PDATA_WIDTH-1:0] mem [APB_PADDR_WIDTH-1:0];
  
  `uvm_component_utils(apb_slave_memory `APB_PARAM_LIST)
  
  function new (string name="apb_slave_memory", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
  endfunction
  
  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
  endfunction

  function void write();
  endfunction
endclass
