module adder(input clk,reset,input[3:0]a,b,output reg[4:0]y);
  always@(posedge clk)begin
    assign y = a + b;
  end
  initial begin
    $monitor("data passed a %0d b %0d y %0d", a,b,y);
  end
endmodule
//This is a adder dut with interface. Make a uvm environment to verify if the half adder is working properly.  Code it a send it to me by  EOD.    
//`uvm_info({get_type_name," : ID"},$psprintf("Printing Object \n %s",seq_item.sprint()),UVM_HIGH)
