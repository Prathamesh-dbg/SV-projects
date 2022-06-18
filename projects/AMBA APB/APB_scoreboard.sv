//----------------------------------------------------------------------------------------
// 									APB Scoreboard 
//----------------------------------------------------------------------------------------
class apb_scoreboard `APB_PARAM_DECL extends uvm_scoreboard;

  `uvm_component_utils(apb_scoreboard `APB_PARAM_LIST )
  
  function new (string name="apb_scoreboard", uvm_component parent);
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
