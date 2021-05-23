//-------------------------------------------------------------------------
//						DMA_REG_MODEL
//-------------------------------------------------------------------------
class dma_reg_model extends uvm_reg_block;
  `uvm_object_utils(dma_reg_model)
   
  //---------------------------------------
  // register instances
  //---------------------------------------
  rand intr  reg_intr;
  rand ctrl  reg_ctrl;
  rand io_addr  reg_io_addr;
  rand mem_addr reg_mem_addr;
   
  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new (string name = "");
    super.new(name, build_coverage(UVM_NO_COVERAGE));
  endfunction
 
  //---------------------------------------
  // Build Phase
  //---------------------------------------
  function void build;
     
    //---------------------------------------
    //reg creation
    //---------------------------------------
    reg_intr = intr::type_id::create("reg_intr");
    reg_intr.build();
    reg_intr.configure(this);
  
    reg_ctrl = ctrl::type_id::create("reg_ctrl");
    reg_ctrl.build();
    reg_ctrl.configure(this);
     
    reg_io_addr = io_addr::type_id::create("reg_io_addr");
    reg_io_addr.build();
    reg_io_addr.configure(this);
   
    reg_mem_addr = mem_addr::type_id::create("reg_mem_addr");
    reg_mem_addr.build();
    reg_mem_addr.configure(this);
     
    //---------------------------------------
    //Memory map creation and reg map to it
    //---------------------------------------
    default_map = create_map("my_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(reg_intr , 'h0, "RW");  // reg, offset, access
    default_map.add_reg(reg_ctrl , 'h4, "RW");
    default_map.add_reg(reg_io_addr , 'h8, "RW");
    default_map.add_reg(reg_mem_addr, 'hC, "RW");
     
    lock_model();
  endfunction
endclass