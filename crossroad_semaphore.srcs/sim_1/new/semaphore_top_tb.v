`timescale 1ns / 1ps

module semaphore_top_tb;

    // Inputs
    reg buff_en;
    reg[4:0] sem0_car_wire;
    reg[4:0] sem0_people_wire;
    reg[4:0] sem1_car_wire;
    reg[4:0] sem1_people_wire;
    
    // Outputs

    // Semaphore 0
    // LED[0] - PERSON_G
    // LED[1] - PERSON_R
    wire LED17_R;
    wire LED17_G;
    wire LED17_B;

    // Semaphore 1
    // LED[2] - PERSON_G
    // LED[3] - PERSON_R
    wire LED16_R;
    wire LED16_G;
    wire LED16_B;
    
    wire[4:0] LED;
    
    // Instantiate the semaphore_top module
    semaphore_top dut ();

    // Stimulus
    initial begin

    end

endmodule // semaphore_top_tb