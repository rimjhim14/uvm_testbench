class seq extends uvm_sequence#(seq_item);
  seq_item req;
  `uvm_object_utils(seq)
  function new(string name = "seq");
    super.new(name);
  endfunction
   
  virtual task pre_body();
    `uvm_info("Seq_1","Pre body of sequence_1 executed",UVM_NONE);
  endtask
  virtual task body();
    /*req = seq_item::type_id::create("req");  
    wait_for_grant();                            
    assert(req.randomize());                                 
    send_request(req);                           
    wait_for_item_done();                        
    get_response(rsp); */
    //or
    repeat(5) begin
    `uvm_do(req);
    //`uvm_info("Seq_1",$sformatf("Item Sent are :- a = %0d , b=%0d",req.a,req.b),UVM_NONE);
      #5;
      `uvm_info(get_type_name(), "seq data generated", UVM_LOW);
    end
    
    //or
    //`uvm_create(req)
    //assert(req.randomize());
    //`uvm_send(req);
    
  endtask
  
endclass
