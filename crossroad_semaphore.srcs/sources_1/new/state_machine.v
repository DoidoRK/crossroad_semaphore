`timescale 1ns / 1ps

module state_machine(
    input wire[7:0] count,
    input reg[3:0] sem0_car_num,
    input reg[3:0] sem0_people_num,
    input reg[3:0] sem1_car_num,
    input reg[3:0] sem1_people_num,

    output wire rst_count,
    output wire read_en,
    output reg[1:0] state_sem_0,
    output reg[1:0] state_sem_1
    );
    

endmodule
