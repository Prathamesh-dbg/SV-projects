//----------------------------------------------------------------------------------------
// 									APB Sequence Item
//----------------------------------------------------------------------------------------
class apb_seq_item `APB_PARAM_DECL extends uvm_sequence_item;
  
  rand access_t                   wr_rd;
  rand bit [APB_PADDR_WIDTH-1:0]  addr;
  rand bit [APB_PDATA_WIDTH-1:0]  data;
  rand                            prot_t prot;
  rand bit [(APB_PDATA_WIDTH/8)-1:0] wstrb;
  //rand slverr_t                   slverr;
  
  constraint write_const{
              wr_rd dist {
              WRITE:=50,
              READ:=50
            };
  }
  
  
  `uvm_object_param_utils_begin(apb_seq_item `APB_PARAM_LIST)
    `uvm_field_enum (access_t,wr_rd    ,UVM_ALL_ON)
    `uvm_field_int  (addr              ,UVM_ALL_ON)
    `uvm_field_int  (data              ,UVM_ALL_ON)
    `uvm_field_int  (wstrb             ,UVM_ALL_ON)
    `uvm_field_enum (prot_t,prot       ,UVM_ALL_ON)
    //`uvm_field_enum (slverr_t,slverr   ,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new (string name="apb_seq_item");
    super.new(name);
  endfunction
  
endclass
