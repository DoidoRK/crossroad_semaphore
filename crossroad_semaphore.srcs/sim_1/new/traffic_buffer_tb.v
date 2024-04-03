`timescale 1ns / 1ps

module traffic_buffer_tb;

    // Inputs
    parameter CLK100MHZ = 5;  // Generates clock in a 100Mhz rate
    reg clk;
    reg enable;
    reg[15:0] SW = 16'b0000000000000000;
    
    // Outputs
    wire[3:0] sem0_car_num_reg;
    wire[3:0] sem0_people_num_reg;
    wire[3:0] sem1_car_num_reg;
    wire[3:0] sem1_people_num_reg;
    
    // Instantiate the traffic_buffer module
    traffic_buffer dut (
        .buff_en(enable),
        
        .SW(SW),

        .sem0_car_num_reg(sem0_car_num_reg),
        .sem0_people_num_reg(sem0_people_num_reg),
        .sem1_car_num_reg(sem1_car_num_reg),
        .sem1_people_num_reg(sem1_people_num_reg)
    );

    always #CLK100MHZ clk = ~clk;

    always #10 enable = ~enable; //Enables buffer read every 10 time units.

    // Stimulus
    initial begin
        // Initialize signals
        enable = 0;
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