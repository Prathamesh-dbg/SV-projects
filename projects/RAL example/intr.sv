class intr extends uvm_reg;
  `uvm_object_utils(intr)
    
  //---------------------------------------
  // fields instance
  //---------------------------------------
  rand uvm_reg_field status;
  rand uvm_reg_field mask;
 
  //---------------------------------------
  // Constructor
  //---------------------------------------  
  function new (string name = "intr");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction
 
  //---------------------------------------
  // build_phase -
  // 1. Create the fields
  // 2. Configure the fields
  //--------------------------------------- 
  function void build;
     
    // Create bitfield
    status = uvm_reg_field::type_id::create("status");  
    // Configure
    status.configure(.parent(this),
                     .size(16),
                     .lsb_pos(0),
                     .access("RW"), 
                     .volatile(0),
                     .reset(0),
                     .has_reset(1),
                     .is_rand(1),
                     .individually_accessible(0));
    // Below line is equivalen to above one  
    // status.configure(this, 32,       0,   "RW",   0,        0,        1,        1,      0);
    //                  reg, bitwidth, lsb, access, volatile, reselVal, hasReset, isRand, fieldAccess
     
    mask = uvm_reg_field::type_id::create("mask");  
    mask.configure(.parent(this),
                     .size(16),
                     .lsb_pos(16),
                     .access("RW"), 
                     .volatile(0),
                     .reset(0),
                     .has_reset(1),
                     .is_rand(1),
                     .individually_accessible(0));   
    endfunction
endclass