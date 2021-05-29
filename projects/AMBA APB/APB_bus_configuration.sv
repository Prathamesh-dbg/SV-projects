//----------------------------------------------------------------------------------------
// 									APB Bus Configuration
//----------------------------------------------------------------------------------------
class apb_bus_configuration `APB_PARAM_DECL extends uvm_object;
  
  logic [APB_PADDR_WIDTH-1:0] slv_start_addr,
                              slv_end_addr;
  rand int                    pready_cc;
  rand int                    psel_cc;
  
  rand int                    pready_10cc_wt,pready_20cc_wt,pready_40cc_wt,pready_50cc_wt,pready_70cc_wt,pready_100cc_wt;
  rand int                    psel_10cc_wt,psel_20cc_wt,psel_40cc_wt,psel_50cc_wt,psel_70cc_wt,psel_100cc_wt;

  `uvm_object_param_utils_begin(apb_bus_configuration `APB_PARAM_LIST)
    `uvm_field_int(slv_start_addr     ,UVM_ALL_ON)
    `uvm_field_int(slv_end_addr       ,UVM_ALL_ON)
    `uvm_field_int(pready_cc          ,UVM_ALL_ON)
    `uvm_field_int(psel_cc            ,UVM_ALL_ON)
    `uvm_field_int(pready_10cc_wt    ,UVM_ALL_ON)
    `uvm_field_int(pready_20cc_wt    ,UVM_ALL_ON)
    `uvm_field_int(pready_40cc_wt    ,UVM_ALL_ON)
    `uvm_field_int(pready_50cc_wt    ,UVM_ALL_ON)
    `uvm_field_int(pready_70cc_wt    ,UVM_ALL_ON)
    `uvm_field_int(pready_100cc_wt   ,UVM_ALL_ON)
    `uvm_field_int(psel_10cc_wt      ,UVM_ALL_ON)
    `uvm_field_int(psel_20cc_wt      ,UVM_ALL_ON)
    `uvm_field_int(psel_40cc_wt      ,UVM_ALL_ON)
    `uvm_field_int(psel_50cc_wt      ,UVM_ALL_ON)
    `uvm_field_int(psel_70cc_wt      ,UVM_ALL_ON)
    `uvm_field_int(psel_100cc_wt     ,UVM_ALL_ON)
  `uvm_object_utils_end

  constraint pready_const{
             pready_cc dist {
                    10:= pready_10cc_wt,
                    20:= pready_20cc_wt,
                    40:= pready_40cc_wt,
                    50:= pready_50cc_wt,
                    70:= pready_70cc_wt,
                    100:= pready_100cc_wt
           };
  }
  
  constraint psel_const{
             psel_cc dist {
                    10:= psel_10cc_wt,
                    20:= psel_20cc_wt,
                    40:= psel_40cc_wt,
                    50:= psel_50cc_wt,
                    70:= psel_70cc_wt,
                    100:= psel_100cc_wt
           };
  }
  
  function new (string name="apb_bus_configuration");
    super.new(name);
  endfunction
  
  function set_config ();
    this.randomize();
    slv_start_addr = 32'h0000;
    slv_end_addr = 32'h1000;
    
    pready_10cc_wt =  60;
    pready_20cc_wt =  60;
    pready_40cc_wt =  20;
    pready_50cc_wt =  20;
    pready_70cc_wt =  10;
    pready_100cc_wt = 10;
    
    psel_10cc_wt =  60;
    psel_20cc_wt =  60;
    psel_40cc_wt =  20;
    psel_50cc_wt =  20;
    psel_70cc_wt =  10;
    psel_100cc_wt = 10;
  endfunction

endclass
