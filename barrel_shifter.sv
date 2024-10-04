module barrel_shifter(clk,reset,valid,value,value_out);
  input logic clk,reset,valid;
  input logic [3:0] value;
  output logic value_out;
  
  logic out_value;
  logic [3:0] int_value;
  always@(posedge clk or posedge reset)
    begin
      if(reset)begin
        out_value <= 1'b0;
        int_value <= 'b0;
      end
      else if(valid)
        int_value<=value;
      else begin
        out_value<={3'b0,int_value[3]};
        int_value<=int_value << 1;
      end
    end
  
  assign value_out = out_value;
  
endmodule
