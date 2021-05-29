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
