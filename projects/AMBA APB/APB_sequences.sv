//----------------------------------------------------------------------------------------
// 									APB Sequences
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// apb_base_sequence
//----------------------------------------------------------------------------------------
class apb_base_sequence extends uvm_sequence#(apb_seq_item);

  `uvm_object_utils(apb_base_sequence)
  
  function new (string name="apb_base_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
  endtask

endclass

//----------------------------------------------------------------------------------------
// apb_wr_seq
//----------------------------------------------------------------------------------------
class apb_wr_seq extends apb_base_sequence;

  `uvm_object_utils(apb_wr_seq)
  
  function new (string name="apb_wr_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,
                {
                  req.wr_rd==WRITE;
                }
              );
  endtask

endclass

//----------------------------------------------------------------------------------------
// apb_rd_seq
//----------------------------------------------------------------------------------------
class apb_rd_seq extends apb_base_sequence;

  `uvm_object_utils(apb_rd_seq)
  
  function new (string name="apb_rd_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,
                {
                  req.wr_rd==READ;
                }
              );
  endtask

endclass

//----------------------------------------------------------------------------------------
// slv_random_ready_seq
//----------------------------------------------------------------------------------------
class slv_random_ready_seq extends apb_base_sequence;

  `uvm_object_utils(slv_random_ready_seq)
  
  function new (string name="slv_random_ready_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(`SEQ_COUNT)
    `uvm_do_with(req,
                {
                  req.prot==DATA_SEC_NRM;
                }
              );
  endtask

endclass

//----------------------------------------------------------------------------------------
// mstr_random_valid_seq
//----------------------------------------------------------------------------------------
class mstr_random_valid_seq extends apb_base_sequence;

  `uvm_object_utils(mstr_random_valid_seq)
  
  function new (string name="mstr_random_valid_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(`SEQ_COUNT)
    `uvm_do_with(req,
                {
                  req.prot==DATA_SEC_NRM;
                  req.addr inside {['h500:'h1500]};
                }
              );
  endtask

endclass
