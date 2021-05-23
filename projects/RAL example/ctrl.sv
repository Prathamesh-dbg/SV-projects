class ctrl extends uvm_reg;
  `uvm_object_utils(ctrl)
    
  //---------------------------------------
  // fields instance
  //---------------------------------------
  rand uvm_reg_field start_dma;
  rand uvm_reg_field w_count;
  rand uvm_reg_field io_mem;
  rand uvm_reg_field reserved;
 
  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new (string name = "ctrl");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction
 
  //---------------------------------------
  // build_phase -
  // 1. Create the fields
  // 2. Configure the fields
  //--------------------------------------- 
  function void build;
    start_dma = uvm_reg_field::type_id::create("start_dma");  
    start_dma.configure(.parent(this),
                        .size(1),
                        .lsb_pos(0), 
                        .access("RW"),  
                        .volatile(0), 
                        .reset(0), 
                        .has_reset(1), 
                        .is_rand(1), 
                        .individually_accessible(0)); 
     
    w_count = uvm_reg_field::type_id::create("w_count");  
    w_count.configure(.parent(this), 
                      .size(8), 
                      .lsb_pos(1), 
                      .access("RW"),  
                      .volatile(0), 
                      .reset(0), 
                      .has_reset(1), 
                      .is_rand(1), 
                      .individually_accessible(0));    
             
    io_mem = uvm_reg_field::type_id::create("io_mem");  
    io_mem.configure(.parent(this), 
                     .size(1), 
                     .lsb_pos(9), 
                     .access("RW"),   
                     .volatile(0),  
                     .reset(0),  
                     .has_reset(1),  
                     .is_rand(1),  
                     .individually_accessible(0));  
             
    reserved = uvm_reg_field::type_id::create("reserved");  
    reserved.configure(.parent(this), 
                       .size(22), 
                       .lsb_pos(10), 
                       .access("RW"),    
                       .volatile(0),   
                       .reset(0),   
                       .has_reset(1),   
                       .is_rand(1),   
                       .individually_accessible(0));       
    endfunction
endclass