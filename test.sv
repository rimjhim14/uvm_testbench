//initiates the environment component construction
//`include "seq_item.sv"
//`include "seq.sv"
//`include "seqr.sv"
//`include "driver.sv"
//`include "monitor.sv"
//`include "scoreboard.sv"
//`include "agent.sv"
//`include "env.sv"

class test extends uvm_test;
  envi env;
  seq seqq;
  `uvm_component_utils(test)
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    env = envi::type_id::create("env",this);
   // seqq = seq::type_id::create("seqq",this)
   endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seqq = seq::type_id::create("seqq",this);
    repeat(10);begin
      #5 seqq.start(env.agt.ad_seqr);
    end
    phase.drop_objection(this);
    `uvm_info(get_type_name, "end test case" , UVM_LOW);
  endtask
endclass
