RTL code that counts the number of ones and zeroes in the input and asserts a valid if there are minimum of 5 1's and 5 0's.

module five_min(clk,reset,value,valid,valid_out);
  input logic clk,reset,valid;
  input logic [31:0] value;
  output logic valid_out;
  
  logic [2:0] count_cycle;
  logic [4:0] count_ones,count_zeroes;
  logic [31:0] in_value;
 
  always_comb 
    begin
    count_ones=0;
  	count_zeroes=0;
      for(int i=0;i<32;i=i+1)begin
        if(value[i] == 1'b1)
          count_ones = count_ones + 1'b1;
      else if(value[i] == 1'b0)
          count_zeroes = count_zeroes + 1'b1;
      end
  end
   
  always@(posedge clk)begin
    if(reset)
      count_cycle<='b0;
    else if(count_ones>=5 && count_zeroes>=5 )begin
      valid_out<=1'b1;
    end
    else begin
      valid_out<=1'b0;
    end
  end
