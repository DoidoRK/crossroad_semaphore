`timescale 1ns / 1ps

module traffic_buffer_tb;

    // Inputs
    parameter CLK100MHZ = 5;  // Generates clock in a 100Mhz rate
    reg clk;
    reg[7:0] SW = 8'b00000000;
    
    // Outputs
    wire[3:0] car_num_reg;
    wire[3:0] people_num_reg;
    
    // Instantiate the traffic_buffer module
    traffic_buffer dut (
        .switch_input(SW),

        .car_num(car_num_reg),
        .people_num(people_num_reg)
    );

    always #CLK100MHZ clk = ~clk;

    // Stimulus
    initial begin
        // Initialize signals
        clk = 0;

        // Change SW values every 5 clocks
        repeat (16) begin
            #CLK100MHZ;
            #CLK100MHZ;
            #CLK100MHZ;
            #CLK100MHZ;
            #CLK100MHZ;
            SW = SW + 16'b0001000100010001; // Increment SW value
        end

        // End simulation
        $finish;
    end

endmodule // traffic_buffer_tb