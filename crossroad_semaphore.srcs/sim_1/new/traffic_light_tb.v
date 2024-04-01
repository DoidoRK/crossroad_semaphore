`timescale 1ns / 1ps

module traffic_light_tb;

    // Inputs
    reg [1:0] select;
    
    // Outputs
    wire [4:0] lights;
    
    // Instantiate the traffic_light module
    traffic_light dut (
        .select(select),
        .lights(lights)
    );

    // Stimulus
    initial begin
        $monitor("Time=%0t, Select=%b, Lights=%b", $time, select, lights);
        
        // Test case 1: Select 00
        select = 2'b00;
        #10; // Wait for 10 time units
        
        // Test case 2: Select 01
        select = 2'b01;
        #10; // Wait for 10 time units
        
        // Test case 3: Select 10
        select = 2'b10;
        #10; // Wait for 10 time units
        
        // Test case 4: Invalid select
        select = 2'b11;
        #10; // Wait for 10 time units
        
        // End simulation
        $finish;
    end

endmodule // traffic_light_tb
