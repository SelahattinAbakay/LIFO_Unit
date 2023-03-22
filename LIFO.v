module LIFO (
    input clk,rst,write_e,read_e,
    input [10:0] din,
    output [10:0] dout
    );
    

    reg [3:0] addr;
    reg [10:0] mem [15:0];
    always@(posedge clk) 
    if(rst)
    addr <= 0;
    else begin
        if (write_e == 0 && read_e == 1 )
        if(addr > 0) 
            addr <= addr - 1;
       
         if (write_e == 1  && read_e == 0)
          if(addr < 15)
              addr <= addr + 1;
    end
    always @(posedge clk) 
    if (write_e) 
        mem[addr] <= din;
       assign dout = mem[addr];
    
endmodule