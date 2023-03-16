`include "design.sv"
`include "interface.sv"
`include "package.sv"
module tb_top;
  import uvm_pkg::*;
  import adder_pkg::*;
  
  bit clk;
  bit reset;
  always #2 clk = ~clk;
  
  initial begin
    //clk = 0;
    reset = 1;
    #5; 
    reset = 0;
  end
  adder_if vif(clk, reset);
  
  adder adder_dut(.clk(vif.clk),.reset(vif.reset),.a(vif.a),.b(vif.b),.y(vif.y));
  
  initial begin
    // set interface in config_db
    uvm_config_db#(virtual adder_if)::set(uvm_root::get(), "*", "vif", vif);
    //`uvm_info({get_type_name," : ID"},$psprintf("Printing Object \n //%s",obj.sprint()),UVM_HIGH);
  end
 initial begin
  //repeat(5) begin
    run_test("test");
   // #2000;
   // $finish;
  end
endmodule
