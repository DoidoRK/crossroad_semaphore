`timescale 1ns / 1ps

module semaphore_top (
    input CLK100MHZ,
    input wire[15:0] SW,
    output wire[4:0] LED,
    output wire LED17_R,
    output wire LED17_G,
    output wire LED17_B,
    output wire LED16_R,
    output wire LED16_G,
    output wire LED16_B
);
    //  Time counter data
    wire clk_1hz;
    wire rst_count;
    wire[7:0] count;

    //  Car and people counters
    wire[3:0] sem0_car_num;
    wire[3:0] sem1_car_num;
    wire[3:0] sem0_people_num;
    wire[3:0] sem1_people_num;

    //  Traffic lights states
    wire[1:0] state_traffic_light_0;
    wire[1:0] state_traffic_light_1;

    //  Clock divider instance
    clock_divider dut2(.clock_in(CLK100MHZ),.clock_out(clk_1hz));

    //  State machine instance
    state_machine state_machine(
        .clk(clk_1hz),
        .sem_0_car_num(sem0_car_num),
        .sem_1_car_num(sem1_car_num),
        .sem_0_people_num(sem0_people_num),
        .sem_1_people_num(sem1_people_num),
        .sem_0_state(state_traffic_light_0),
        .sem_1_state(state_traffic_light_1)
    );

    // Semafore 0 Traffic_light module instance
    traffic_light sem_0 (
        .select(state_traffic_light_0), // Using only two LSBs of sem0_car_num_reg
        .PERSON_G(LED[0]),
        .PERSON_R(LED[1]),
        .CAR_R(LED17_R),
        .CAR_G(LED17_G),
        .CAR_B(LED17_B)
    );

    // Semafore 0 Traffic_buffer instance
    traffic_buffer sem_0_inputs (
        .switch_input(SW[7:0]),

        .car_num(sem0_car_num_reg),
        .people_num(sem0_people_num_reg)
    );

    // Semafore 1 Traffic_light module instance
    traffic_light sem_1 (
        .select(state_traffic_light_1), // Using only two LSBs of sem1_car_num_reg
        .PERSON_G(LED[2]),
        .PERSON_R(LED[3]),
        .CAR_R(LED16_R),
        .CAR_G(LED16_G),
        .CAR_B(LED16_B)
    );

    // Semafore 1 Traffic_buffer instance
    traffic_buffer sem_1_inputs (
        .switch_input(SW[15:7]),

        .car_num(sem1_car_num_reg),
        .people_num(sem1_people_num_reg)
    );

endmodule // semaphore_top