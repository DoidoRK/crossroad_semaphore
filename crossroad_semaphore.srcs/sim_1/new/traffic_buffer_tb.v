`timescale 1ns / 1ps

module traffic_buffer_tb;

    // Inputs
    reg enable;
    reg[15:0] SW;
    
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

    always #5 enable = ~enable; // Invert clock every 5 time units in order to generate 100Mhz clock

    // Stimulus
    initial begin
        // Initialize signals
        enable = 1;
        SW = 16'b0000000000000000; // Initialize SW
        
        // Change SW values every 5 nanoseconds
        repeat (16) begin
            #10; // Wait for 5 nanoseconds
            SW = SW + 16'b0001000100010001; // Increment SW value
        end

        // End simulation
        $finish;
    end

    // Display register values at each change
    always @(posedge enable) begin
        $display("At time %t, sem0_car_num_reg=%b, sem0_people_num_reg=%b, sem1_car_num_reg=%b, sem1_people_num_reg=%b", $time, sem0_car_num_reg, sem0_people_num_reg, sem1_car_num_reg, sem1_people_num_reg);
    end

endmodule // traffic_buffer_tb