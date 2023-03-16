class agent extends uvm_agent;
  `uvm_component_utils(agent)
  adder_sequencer ad_seqr;
  driver driv;
  monitor mon;
  function new(string name = "agent", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  //////////////build_phase////////////////
  function void build_phase(uvm_phase phase);
   if(get_is_active == UVM_ACTIVE) begin 
     driv = driver::type_id::create("driv", this);
     ad_seqr = adder_sequencer::type_id::create("seqr", this);
   end 
    mon = monitor::type_id::create("mon",this);
  endfunction
  //////////////connect_phase//////////////
  function void connect_phase(uvm_phase phase);
    if(get_is_active == UVM_ACTIVE) begin 
      driv.seq_item_port.connect(ad_seqr.seq_item_export);
    end
  endfunction
endclass
