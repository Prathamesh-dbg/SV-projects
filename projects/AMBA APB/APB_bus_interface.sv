//----------------------------------------------------------------------------------------
// 									APB Bus Interface
//----------------------------------------------------------------------------------------
interface apb_bus_interface `APB_PARAM_DECL (input logic PCLK,PRESETn);

	
	logic [APB_PADDR_WIDTH-1:0] 		PADDR;
	logic [2:0] 						PPROT;
	logic 								PSEL;
	logic 								PENABLE;
	logic 								PWRITE;
	logic [APB_PDATA_WIDTH-1:0] 		PWDATA;
	logic [(APB_PDATA_WIDTH/8)-1:0] 	PSTRB;
	logic                 PREADY;
	logic [APB_PDATA_WIDTH-1:0] 		PRDATA;
	logic								PSLVERR;
	

endinterface
