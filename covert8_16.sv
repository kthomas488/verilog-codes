module convert8_16(clk,reset,value,valid,out_valid,out_value);
  input logic clk,reset;
  input logic [7:0] value;
  input logic valid;
  output logic [15:0]out_value;
  output logic out_valid;
  
  logic [15:0]intr_value;
  logic [3:0] counter;
  logic [14:0] int_value;
  always@(posedge clk or posedge reset )
    begin
      if(reset)begin
        intr_value<=16'b0;
      	counter<='b0;
        int_value<='b0;
      end
      else if (valid)begin
        if(counter == 2)
        counter<=4'b0000;
        else begin
          intr_value <={intr_value,value};
        counter<=counter+1'b1;
        end
    end
    end
  
        assign out_value = counter == 2 ? intr_value:8'b0;
        assign out_valid = counter == 2;
        
  
endmodule
      
      
