//----------------------------------------------------------------------------------------
// 									APB Slave Sequencer
//----------------------------------------------------------------------------------------
class apb_slave_sequencer `APB_PARAM_DECL extends uvm_sequencer#(apb_seq_item);

  `uvm_component_utils(apb_slave_sequencer `APB_PARAM_LIST )
  
  function new (string name="apb_slave_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
  endfunction
  
endclass
