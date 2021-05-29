//----------------------------------------------------------------------------------------
// 									APB Test
//----------------------------------------------------------------------------------------
//								
//								  BUILD_PHASE
//									   |
//								  CONNECT_PHASE					  ( PRE_RESET		)
//									   |						  ( RESET			)
//							      END_OF_ELABORATION			  (	POST_RESET		)
//									   |						  ( 				)
//							      START_OF_SIMULATION	 		  ( PRE_CONFIGURE	)
//									   |						  ( CONFIGURE		)
//								  RUN_PHASE-----------------------(	POST_CONFIGURE	)
//									   |						  ( 				)
//								  EXTRACT_PHASE					  (	PRE_MAIN		)
//									   |						  (	MAIN			)
//								  CHECK_PHASE					  (	POST_MAIN		)
//									   |						  ( 				)
//								  REPORT_PHASE					  (	PRE_SHUTDOWN	)
//									   |						  (	SHUTDOWN		)
//								  FINAL_PHASE					  (	POST_SHUTDOWN	)
//
//
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// apb_base_test
//----------------------------------------------------------------------------------------
class apb_base_test extends uvm_test;
	
  apb_bus_env `APB_PARAM_LIST	apb_env;
  apb_bus_configuration `APB_PARAM_LIST apb_cfg;
  apb_base_sequence apb_seq;

  `uvm_component_utils(apb_base_test)
  
  function new (string name="apb_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	  `uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
	  apb_env=apb_bus_env `APB_PARAM_LIST::type_id::create("apb_env",this);
    
    apb_cfg=apb_bus_configuration`APB_PARAM_LIST::type_id::create("apb_cfg");
    apb_cfg.set_config();
    uvm_config_db#(apb_bus_configuration`APB_PARAM_LIST	)::set(this,"apb_env.*","apb_cfg",apb_cfg);
  endfunction
  
  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
	  `uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
  endfunction
  
  virtual function void end_of_elaboration_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"END_OF_ELABORATION",UVM_NONE)
    uvm_top.print_topology();
  endfunction
  
  virtual function void start_of_simulation_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"START_OF_SIMULATION",UVM_NONE)
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
    phase.raise_objection(this);
    phase.drop_objection(this);
  endtask
  
  virtual function void extract_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"EXTRACT_PHASE",UVM_NONE)
  endfunction
  
  virtual function void check_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"CHECK_PHASE",UVM_NONE)
  endfunction
  
  virtual function void report_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"REPORT_PHASE",UVM_NONE)
  endfunction
  
  virtual function void final_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"FINAL_PHASE",UVM_NONE)
  endfunction
  
endclass

//----------------------------------------------------------------------------------------
// basic_wr_rd_test	
//----------------------------------------------------------------------------------------
class basic_wr_rd_test extends apb_base_test;
  
  apb_wr_seq  seq0,seq1;
  apb_rd_seq seq2,seq3;

  `uvm_component_utils(basic_wr_rd_test)
  
  function new (string name="basic_wr_rd_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	  `uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
  endfunction
  
  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
	  `uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
    phase.raise_objection(this);

    seq0=apb_wr_seq::type_id::create("seq0");
    seq2=apb_rd_seq::type_id::create("seq2");
    seq1=apb_wr_seq::type_id::create("seq1");
    seq3=apb_rd_seq::type_id::create("seq3");

    fork
      seq0.start(apb_env.mstr_agent.mstr_seqr);
      seq1.start(apb_env.slv_agent.slv_seqr);
    join
    fork
      seq2.start(apb_env.mstr_agent.mstr_seqr);
      seq3.start(apb_env.slv_agent.slv_seqr);
    join

    phase.drop_objection(this);
  endtask
  
endclass

//----------------------------------------------------------------------------------------
// random_valid_ready_test	
//----------------------------------------------------------------------------------------
class random_valid_ready_test extends apb_base_test;
  
  mstr_random_valid_seq seq0;
  slv_random_ready_seq seq1;
  
  `uvm_component_utils(random_valid_ready_test)
  
  function new (string name="random_valid_ready_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	  `uvm_info(get_full_name(),"BUILD_PHASE",UVM_NONE)
  endfunction
  
  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
	  `uvm_info(get_full_name(),"CONNECT_PHASE",UVM_NONE)
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    `uvm_info(get_full_name(),"RUN_PHASE",UVM_NONE)
    phase.raise_objection(this);
    
    seq0=mstr_random_valid_seq::type_id::create("seq0");
    seq1=slv_random_ready_seq::type_id::create("seq1");
    
    fork
      seq0.start(apb_env.mstr_agent.mstr_seqr);
      seq1.start(apb_env.slv_agent.slv_seqr);
    join

    phase.drop_objection(this);
  endtask
  
endclass
