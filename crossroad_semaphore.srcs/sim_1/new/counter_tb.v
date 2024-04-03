`timescale 1ns / 1ps

module counter_tb;

    // Parameters
    parameter CLK_PERIOD = 100; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire[7:0] count;

    // Instantiate the counter module
    counter dut (
        .in_signal(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    always #CLK_PERIOD clk = ~clk; // Generate clock with specified period

    // Reset generation
    initial begin
        clk = 0;
        rst = 1; // Assert reset initially
        #50; // Wait for a few cycles
        rst = 0; // De-assert reset
    end

    // Display count value
    always @(posedge clk) begin
        $display("Time=%0t, Count=%d", $time, count);
    end

endmodule // counter_tb