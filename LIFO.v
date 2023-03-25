module LIFO (
    input clk,rst,write_e,read_e,  //clock, reset, write enable, read enable.
    input [10:0] din,  //data input
    output [10:0] dout // data output
    );
    

    reg [3:0] addr;  //  address register.
    reg [10:0] mem [15:0];  // LIFO Memory register between 11 and 16 bits.
    always@(posedge clk) // procedural statement in clock
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
