typedef uvm_sequencer#(seq_item) adder_sequencer;

class driver extends uvm_driver#(seq_item);
  virtual adder_if vif;
  `uvm_component_utils(driver)
  function new(string name = "driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    //uvm config db get method
    if(!uvm_config_db#(virtual adder_if) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Not set at top level");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      
      seq_item_port.get_next_item(req);
      `uvm_info(get_type_name, $psprintf("a = %0d, b = %0d", req.a, req.b), UVM_NONE);
      
      vif.a <= req.a;
      vif.b <= req.b;
      
      seq_item_port.item_done();
    end
  endtask
endclass
