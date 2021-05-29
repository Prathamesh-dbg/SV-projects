//----------------------------------------------------------------------------------------
// 									APB Master Driver
//----------------------------------------------------------------------------------------
class apb_master_driver `APB_PARAM_DECL extends uvm_driver#(apb_seq_item);
  
  virtual apb_bus_interface	`APB_PARAM_LIST	vif;
  apb_bus_configuration`APB_PARAM_LIST cfg;
  
  `uvm_component_param_utils(apb_master_driver `APB_PARAM_LIST)
  
  function new (string name="apb_master_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	  `uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	  if(!uvm_config_db#(virtual apb_bus_interface	`APB_PARAM_LIST	)::get(this,"","vif",vif))
	  	`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
    
    if(!uvm_config_db#(apb_bus_configuration`APB_PARAM_LIST	)::get(this,"","apb_cfg",cfg))
	  	`uvm_fatal("NOCFG",{"Bus configuration must be set for: ",get_full_name(),".cfg"});
  endfunction
  
  task run_phase(uvm_phase phase);
	  `uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
    
    fork
      begin
        forever
        begin
          seq_item_port.get_next_item(req);
          drive();
          seq_item_port.item_done();
        end
      end
      begin
        forever
          begin
            wait(vif.PRESETn==0);
            vif.PADDR   <= '0;
            vif.PWRITE  <= '0;
            vif.PSEL    <= '0;
            vif.PPROT   <= '0;
            vif.PENABLE <= '0;
            vif.PWDATA  <= '0;
            wait(vif.PRESETn==1);
          end
      end
    join
  endtask

  task drive();
    wait(vif.PRESETn==1);
    repeat(cfg.psel_cc) @(posedge vif.PCLK);           //SETUP PHASE
    vif.PADDR   <= req.addr;
    vif.PWRITE  <= (req.wr_rd==WRITE)? 1'b1: 1'b0;
    vif.PSEL    <= 1'b1;
    vif.PPROT   <= req.prot;
    vif.PENABLE <= 1'b0;
    
    @(posedge vif.PCLK);           //START OF ACCESS PHASE
    vif.PSEL  <= 1'b1;
    vif.PENABLE <= 1'b1;
    if(req.wr_rd==WRITE)
      vif.PWDATA <= req.data;
    
    @(posedge vif.PCLK);           //END OF ACCESS PHASE
    wait(vif.PREADY)
    
    @(posedge vif.PCLK);           //PSEL DE-ASSERTED
    vif.PADDR   <= '0;
    vif.PWRITE  <= '0;
    vif.PSEL    <= '0;
    vif.PPROT   <= '0;
    vif.PENABLE <= '0;
    vif.PWDATA  <= '0;
  endtask

endclass
