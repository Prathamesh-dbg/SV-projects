//----------------------------------------------------------------------------------------
// 									APB Bus Monitor 
//----------------------------------------------------------------------------------------
class apb_bus_monitor `APB_PARAM_DECL extends uvm_monitor;

  virtual apb_bus_interface	`APB_PARAM_LIST	vif;
  apb_bus_configuration`APB_PARAM_LIST cfg;
  apb_trans`APB_PARAM_LIST trans;
  
  `uvm_component_utils(apb_bus_monitor `APB_PARAM_LIST )
  
  function new (string name="apb_bus_monitor", uvm_component parent);
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
    fork
      begin
        sample_trans();
      end
    join
  endtask
  
  task sample_trans();
    forever @(posedge vif.PCLK)
      if(vif.PSEL && vif.PENABLE && vif.PREADY)
      begin
        if(vif.PWRITE==1)
        begin
          trans.paddr=vif.PADDR;
          trans.pwdata=vif.PWDATA;
          trans.pstrb=vif.PSTRB;
          trans.pprot=vif.PPROT;
        end
        else
        begin
          trans.prdata=vif.PRDATA;
          trans.pslverr=vif.PSLVERR;
        end
      end
  endtask

endclass
