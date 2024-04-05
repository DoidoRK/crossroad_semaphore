`timescale 1ns / 1ps

module state_machine_tb;

    // Inputs
    reg clk;
    reg [3:0] sem_0_car_num;
    reg [3:0] sem_1_car_num;
    reg [3:0] sem_0_people_num;
    reg [3:0] sem_1_people_num;
    wire [1:0] sem_0_state;
    wire [1:0] sem_1_state;

    // State machine instance
    state_machine dut (
        .clk(clk),
        .sem_0_car_num(sem_0_car_num),
        .sem_1_car_num(sem_1_car_num),
        .sem_0_people_num(sem_0_people_num),
        .sem_1_people_num(sem_1_people_num),
        .sem_0_state(sem_0_state),
        .sem_1_state(sem_1_state)
    );

    // Clock generation
    initial begin
        clk = 0;
        sem_0_people_num = 2;
        sem_1_people_num = 14;
        sem_0_car_num = 15;
        sem_1_car_num = 1;
        forever #2 clk = ~clk; // Invert clock every 5 time units to generate a clock
    end

endmodule // clock_divider_tb