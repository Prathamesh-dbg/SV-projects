//=========================================================================
// dma_reg_seq
//=========================================================================
class dma_reg_seq extends uvm_sequence;
 
  `uvm_object_utils(dma_reg_seq)
   
  dma_reg_model regmodel;
   
  //---------------------------------------
  // Constructor
  //---------------------------------------   
  function new (string name = "");
    super.new(name);   
  endfunction
   
  //---------------------------------------
  // Sequence body
  //---------------------------------------     
  task body; 
    uvm_status_e   status;
    uvm_reg_data_t incoming;
    bit [31:0]     rdata;
     
    if (starting_phase != null)
      starting_phase.raise_objection(this);
     
    //Write to the Registers
    regmodel.reg_intr.write(status, 32'h1234_1234);
    regmodel.reg_ctrl.write(status, 32'h1234_5678);
    regmodel.reg_io_addr.write(status, 32'h1234_9ABC);
    regmodel.reg_mem_addr.write(status, 32'h1234_DEF0);
     
    //Read from the registers
    regmodel.reg_intr.read(status, rdata);
    regmodel.reg_ctrl.read(status, rdata);
    regmodel.reg_io_addr.read(status, rdata);
    regmodel.reg_mem_addr.read(status, rdata);
       
    if (starting_phase != null)
      starting_phase.drop_objection(this); 
     
  endtask
endclass

//=========================================================================
// dma_sequence - random stimulus 
//=========================================================================
class dma_sequence extends uvm_sequence#(dma_seq_item);
  
  `uvm_object_utils(dma_sequence)
  
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "dma_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(dma_sequencer)
  
  //---------------------------------------
  // create, randomize and send the item to driver
  //---------------------------------------
  virtual task body();
   repeat(2) begin
    req = dma_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    send_request(req);
    wait_for_item_done();
   end 
  endtask
endclass

//=========================================================================
// write_sequence - "write" type
//=========================================================================
class write_sequence extends uvm_sequence#(dma_seq_item);
  
  `uvm_object_utils(write_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "write_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.wr_en==1;})
  endtask
endclass
//=========================================================================

//=========================================================================
// read_sequence - "read" type
//=========================================================================
class read_sequence extends uvm_sequence#(dma_seq_item);
  
  `uvm_object_utils(read_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.wr_en==0;})
  endtask
endclass

