class monitor extends uvm_monitor;
  virtual adder_if vif;
  uvm_analysis_port #(seq_item) item_collect_port;/////////////
  seq_item mon_item; ///////////////
  `uvm_component_utils(monitor)
  function new(string name = "monitor", uvm_component parent = null);
    super.new(name,parent);
    item_collect_port = new("item_collect_port", this);
    mon_item = new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    //uvm config db get method
    if(!uvm_config_db#(virtual adder_if) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Not set at top level");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      wait(!vif.reset);
      @(posedge vif.clk);
      mon_item.a = vif.a;
      mon_item.b = vif.b;
      `uvm_info(get_type_name, $sformatf("a = %0d, b = %0d  out = %0d", mon_item.a, mon_item.b, mon_item.y), UVM_LOW);
      @(posedge vif.clk);
      mon_item.y = vif.y;
      item_collect_port.write(mon_item);
      `uvm_info(get_type_name, $sformatf("a = %0d, b = %0d  out = %0d", mon_item.a, mon_item.b, mon_item.y), UVM_LOW);/////newchng
    end
  endtask
endclass
