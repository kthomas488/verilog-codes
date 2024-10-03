module fibonacci(clk,reset,valid,value,fib_out);
  input logic clk,reset,valid;
  input logic [3:0] value;
  output logic [3:0] fib_out;
  
  logic [3:0] count;
  logic [3:0] fib_n;
  
  always@(posedge clk or posedge reset)begin
    if(reset) begin
      fib_out<=4'b0;
      count <= 4'b0;
      fib_n <= 4'b0;
    end
    else if(valid) begin
        if(value == 1'b0)begin
          fib_out<=1'b0;
        end
        else if(value == 1'b1) begin
          fib_out<=1'b1;
        end
        else begin 
          count<= value;
          fib_out<=4'b0000;
          fib_n<= 4'b0001;
        end
      
    end
    else if(count != 'b0) begin
        fib_out <= fib_n + fib_out;
        fib_n   <= fib_out;
        count <= count - 1'b1;
    end
  end         
endmodule         
          
          
      
