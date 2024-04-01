`timescale 1ns / 1ps

module traffic_buffer_tb;

    // Inputs
    reg enable;
    reg [4:0] sem0_car_num;
    reg [4:0] sem0_people_num;
    reg [4:0] sem1_car_num;
    reg [4:0] sem1_people_num;
    
    // Outputs
    wire [4:0] sem0_car_num_reg;
    wire [4:0] sem0_people_num_reg;
    wire [4:0] sem1_car_num_reg;
    wire [4:0] sem1_people_num_reg;
    
    // Instantiate the traffic_buffer module
    traffic_buffer dut (
        .buff_en(enable),
        
        .sem0_car_wire(sem0_car_num),
        .sem0_people_wire(sem0_people_num),
        .sem1_car_wire(sem1_car_num),
        .sem1_people_wire(sem1_people_num),

        .sem0_car_num_reg(sem0_car_num_reg),
        .sem0_people_num_reg(sem0_people_num_reg),
        .sem1_car_num_reg(sem1_car_num_reg),
        .sem1_people_num_reg(sem1_people_num_reg)
    );

    // Stimulus
    initial begin
        // Enable the buffer
        enable = 0;
        
        // Assign some values to inputs
        sem0_car_num = 5'b10101;
        sem0_people_num = 5'b01010;
        sem1_car_num = 5'b11011;
        sem1_people_num = 5'b01101;
        
        
        #5; // Wait for a few time units
        enable = 1;

        
        #5; // Wait for a few time units
        enable = 0;

        sem0_car_num = 5'b00000;
        sem0_people_num = 5'b00001;
        sem1_car_num = 5'b00010;
        sem1_people_num = 5'b00011;

        
        #5; // Wait for a few time units
        enable = 1;
        
        
        // Display the outputs
        $display("sem0_car_num_reg=%b", sem0_car_num_reg);
        $display("sem0_people_num_reg=%b", sem0_people_num_reg);
        $display("sem1_car_num_reg=%b", sem1_car_num_reg);
        $display("sem1_people_num_reg=%b", sem1_people_num_reg);
        
        #5;
        // End simulation
        $finish;
    end

endmodule // traffic_buffer_tb