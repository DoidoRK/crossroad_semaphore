`timescale 1ns / 1ps

module counter(
    input in_signal,
    input rst,
    output reg[7:0] count
    );

    always @(posedge in_signal or posedge rst)
    begin
        if (rst)
            count <= 8'b00000000; // Reset the counter
        else
            count <= count + 1; // Increment the counter on each clock cycle
    end

endmodule // counter