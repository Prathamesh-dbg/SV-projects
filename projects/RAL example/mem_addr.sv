class mem_addr extends uvm_reg;
  `uvm_object_utils(mem_addr)
    
  //---------------------------------------
  // fields instance
  //---------------------------------------
  rand uvm_reg_field addr;
 
  //---------------------------------------
  // Constructor
  //---------------------------------------  
  function new (string name = "mem_addr");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction
 
  //---------------------------------------
  // build_phase -
  // 1. Create the fields
  // 2. Configure the fields
  //--------------------------------------- 
  function void build;
     
    // Create bitfield
    addr = uvm_reg_field::type_id::create("addr");  
    // Configure
    addr.configure(.parent(this),
                   .size(32),
                   .lsb_pos(0), 
                   .access("RW"),  
                   .volatile(0), 
                   .reset(0), 
                   .has_reset(1), 
                   .is_rand(1), 
                   .individually_accessible(0));  
    endfunction
endclass