`timescale 1ns / 1ps

module semaphore_top_tb;

    // Inputs
    reg buff_en;
    reg [4:0] sem0_car_wire;
    reg [4:0] sem0_people_wire;
    reg [4:0] sem1_car_wire;
    reg [4:0] sem1_people_wire;
    
    // Outputs
    wire [4:0] lights;
    
    // Instantiate the semaphore_top module
    semaphore_top dut (
        .buff_en(buff_en),
        .sem0_car_wire(sem0_car_wire),
        .sem0_people_wire(sem0_people_wire),
        .sem1_car_wire(sem1_car_wire),
        .sem1_people_wire(sem1_people_wire),
        .lights(lights)
    );

    always #5 buff_en = ~buff_en; // Invert clock every 5 time units in order to generate 100Mhz clock

    // Stimulus
    initial begin
        buff_en = 1;
        // Assign some values to inputs
        sem0_car_wire = 4'b00000;
        sem0_people_wire = 4'b00000;
        sem1_car_wire = 4'b00000;
        sem1_people_wire = 4'b00000;
        
        // Wait for a few time units
        #10;
        sem0_car_wire = 4'b00001;
        #10;
        sem0_car_wire = 4'b00010;
        #10;
        sem0_car_wire = 4'b00011;
        
        // End simulation
        $finish;
    end

endmodule // semaphore_top_tb