RTL code that counts the number of ones and zeroes in the input and asserts a valid if there are minimum of 5 1's and 5 0's.

module five_min(clk,reset,value,valid,valid_out);
  input logic clk,reset,valid;
  input logic [31:0] value;
  output logic valid_out;
  
  logic [4:0] count_ones,count_zeroes;
  logic [31:0] in_value;
  always@(posedge clk or posedge reset)
    begin
      if(reset) begin
        in_value<='b0;
        count_ones<='b0;
        count_zeroes<='b0;
      end
      else if(valid)
        in_value<=value;
      else begin
        for(int i=0;i<31;i=i+1) begin
          if(in_value[i] == 1'b1) begin
            count_ones<= count_ones+1'b1;
          end
          else if(in_value[i] == 1'b0) begin
            count_zeroes<= count_zeroes+1'b1;
          end
          end
        //if(count_ones>=5 && count_zeroes >=5)
        //  valid_out<=1'b1;
      end
    end
  
  always@(posedge clk) begin
    if( count_ones>=5 && count_zeroes >= 5)begin
       valid_out<=1'b1;
    end
  end
  
endmodule
