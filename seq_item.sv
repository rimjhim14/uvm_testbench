class seq_item extends uvm_sequence_item;
  rand bit [3:0] a, b;
  bit [4:0] y; 
  
  function new (string name = "seq_item");
    super.new(name);
  endfunction
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_object_utils_end
endclass
