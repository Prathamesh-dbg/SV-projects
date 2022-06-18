//----------------------------------------------------------------------------------------
// 									APB Common Definitions
//----------------------------------------------------------------------------------------
`define APB_PARAM_DECL \
	#(parameter APB_PADDR_WIDTH=32, \
	  parameter APB_PDATA_WIDTH=32 )


`define APB_PARAM_LIST \
	#(32, \
	  32 )
	
typedef enum{	DATA_SEC_NRM	=0,
				      DATA_SEC_PRIV	=1,
				      DATA_NONSEC_NRM	=2,
				      DATA_NONSEC_PRIV=3,
				      INST_SEC_NRM	=4,
				      INST_SEC_PRIV	=5,
				      INST_NONSEC_NRM	=6,
				      INST_NONSEC_PRIV=7} prot_t;

typedef enum{	READ=0,
	            WRITE=1} access_t;

typedef enum{	NO_ERROR=0,
              ERROR=1} slverr_t;

//----------------------------------------------------------------------------------------
// 								 APB Monitor Transaction packet	
//----------------------------------------------------------------------------------------
class apb_trans `APB_PARAM_DECL extends uvm_object;

  logic [APB_PADDR_WIDTH-1:0] paddr;
  logic [APB_PDATA_WIDTH-1:0] pwdata;
  logic [APB_PDATA_WIDTH-1:0] prdata;
  logic [(APB_PDATA_WIDTH/8)-1:0] pstrb;
  logic                       pwrite;
  logic                       pslverr;
  
  `uvm_object_utils_start(apb_trans `APB_PARAM_LIST)
    `uvm_field_int(paddr  ,UVM_ALL_ON)
    `uvm_field_int(pwdata ,UVM_ALL_ON)
    `uvm_field_int(prdata ,UVM_ALL_ON)
    `uvm_field_int(pstrb  ,UVM_ALL_ON)
    `uvm_field_int(pwrite ,UVM_ALL_ON)
    `uvm_field_int(pslverr,UVM_ALL_ON) 
  `uvm_object_utils_end
  
  function new (string name="apb_trans");
    super.new(name);
  endfunction


endclass

