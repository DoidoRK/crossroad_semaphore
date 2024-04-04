`timescale 1ns / 1ps

module state_machine_tb;
    wire[7:0] count;
    reg[3:0] sem0_car_num;
    reg[3:0] sem0_people_num;
    reg[3:0] sem1_car_num;
    reg[3:0] sem1_people_num;

    wire rst_count;
    wire read_en;
    reg[1:0] state_sem_0;
    reg[1:0] state_sem_1;

    state_machine dut(
        .count(count),
        .sem0_car_num(sem0_car_num),
        .sem0_people_num(sem0_people_num),
        .sem1_car_num(sem1_car_num),
        .sem1_people_num(sem1_people_num),

        .rst_count(rst_count),
        .read_en(read_en),
        .state_sem_0(state_sem_0),
        .state_sem_1(state_sem_1)
    );

endmodule   //state_machine_tb
