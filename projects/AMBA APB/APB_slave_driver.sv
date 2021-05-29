//----------------------------------------------------------------------------------------
// 									APB Slave Driver
//----------------------------------------------------------------------------------------
class apb_slave_driver `APB_PARAM_DECL extends uvm_driver#(apb_seq_item);
  
  virtual apb_bus_interface	`APB_PARAM_LIST	vif;
  apb_bus_configuration `APB_PARAM_LIST cfg;

  `uvm_component_param_utils(apb_slave_driver `APB_PARAM_LIST )
  
  function new (string name="apb_slave_driver", uvm_component parent);
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
            vif.PREADY <= '0;
            vif.PRDATA <= '0;
            vif.PSLVERR <= '0;
            wait(vif.PRESETn==1);
          end
      end
    join
  endtask
  
  task drive();
    wait(vif.PRESETn==1);
    @(posedge vif.PCLK);
    wait(vif.PSEL && vif.PENABLE); 
    
    repeat(cfg.pready_cc) @(posedge vif.PCLK);
    if(req.wr_rd == WRITE)
    begin
      vif.PREADY <= 1'b1;
    end
    else
    begin
      vif.PREADY <= 1'b1;
      vif.PRDATA <= req.data;
    end

    if(vif.PADDR inside {[cfg.slv_start_addr:cfg.slv_end_addr]})
      vif.PSLVERR <= 1'b0;
    else
      vif.PSLVERR <= 1'b1;
    
    @(posedge vif.PCLK);
    vif.PREADY <= '0;
    vif.PRDATA <= '0;
    vif.PSLVERR <='0;
    
  endtask

endclass
