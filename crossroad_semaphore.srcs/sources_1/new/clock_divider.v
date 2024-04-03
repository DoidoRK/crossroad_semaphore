`timescale 1ns / 1ps

module clock_divider(
    input clock_in,
    output reg clock_out
    );

    reg[27:0] counter = 28'd0;
//    parameter DIVIDER = 28'd100000000;
   parameter DIVIDER = 28'd10;
    
    always@(posedge clock_in)
    begin
        counter <= counter + 28'd1;
        if(counter>=(DIVIDER -1))
            counter <= 28'd0;
            clock_out <= (counter<DIVIDER/2)?1'b1:1'b0;
    end
    
endmodule   //clock divider
