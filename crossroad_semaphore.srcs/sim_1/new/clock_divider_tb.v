`timescale 1ns / 1ps

module clock_divider_tb;

    // Inputs
    reg clock_in;
    
    // Outputs
    wire clock_out;

    // Instantiate the clock divider module
    clock_divider dut (
        .clock_in(clock_in),
        .clock_out(clock_out)
    );
    
    // Display clock_out value
    always @(posedge clock_in) begin
        $display("Time=%0t, Clock_out=%b", $time, clock_out);
    end

    // Clock generation
    initial begin
        clock_in = 0;
        forever #5 clock_in = ~clock_in; // Invert clock every 5 time units in order to generate 100Mhz clock
    end

    // Stimulus
//    initial begin
//        // Run simulation for 1 second
//        #200000000 $finish;
//    end

endmodule // clock_divider_tb
