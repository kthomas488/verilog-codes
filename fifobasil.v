module fifo_mem(clock,reset,datain,dataout,read_en,write_en,full,empty);

input clock,reset,read_en,write_en;

output full,empty;

input [7:0]datain;
output reg [7:0]dataout;

reg [7:0]fifomem[0:15];

reg [4:0] count;

reg[3:0]read_pointer,write_pointer;

integer h;

assign empty=(count==0)?1'b1:1'b0;
assign full=(count==16)?1'b1:1'b0;

always@(posedge clock or negedge reset)
begin
	if(!reset)
	begin
		dataout<=0;
		for(h=0;h<8;h=h+1)
			fifomem[h]<=0;
	end
end

always@(posedge clock or negedge reset)
begin:write
		if(!reset)
		   write_pointer<=0;
		else   
			if(write_en&&(count<16))
					begin
						fifomem[write_pointer]<=datain;
						write_pointer<=write_pointer+1;
					end
end

always@(posedge clock or negedge reset)
begin:read 
		if(!reset)
			read_pointer<=0;
		else
			if((read_en)&&(count!=0))
					begin
						dataout<=fifomem[read_pointer];
						read_pointer<=read_pointer+1;
					end
					
end

always@(posedge clock or negedge reset)
begin:status
	if(!reset)
		count<=0;
	else
		if((write_en)&&(read_en))
		begin
			
			if(write_pointer>read_pointer)
					count<=write_pointer-read_pointer;
			else	
				if(write_pointer<read_pointer)
				count<=read_pointer-write_pointer;
			
		end	
	else
		if((write_en)&&!(read_en)&&(count<16))
		count<=count+1;
		if((read_en)&&!(write_en)&&(count!=0))
		count<=count-1;
end	

endmodule
	
	
			
