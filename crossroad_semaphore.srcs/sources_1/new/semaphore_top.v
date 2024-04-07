`timescale 1ns / 1ps

module semaphore_top (
    input CLK100MHZ,
    input wire[15:0] SW,
    output wire[3:0] LED,
    output wire LED17_R,
    output wire LED17_G,
    output wire LED17_B,
    output wire LED16_R,
    output wire LED16_G,
    output wire LED16_B
);
    //  Clock divider wires
    wire clk_1hz;

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
        .person_g(LED[0]),
        .person_r(LED[1]),
        .car_r(LED17_R),
        .car_g(LED17_G),
        .car_b(LED17_B)
    );

    // Semafore 0 Traffic_buffer instance
    traffic_buffer sem_0_inputs (
        .switch_input(SW[7:0]),

        .car_num(sem0_car_num),
        .people_num(sem0_people_num)
    );

    // Semafore 1 Traffic_light module instance
    traffic_light sem_1 (
        .select(state_traffic_light_1), // Using only two LSBs of sem1_car_num_reg
        .person_g(LED[2]),
        .person_r(LED[3]),
        .car_r(LED16_R),
        .car_g(LED16_G),
        .car_b(LED16_B)
    );

    // Semafore 1 Traffic_buffer instance
    traffic_buffer sem_1_inputs (
        .switch_input(SW[15:8]),

        .car_num(sem1_car_num),
        .people_num(sem1_people_num)
    );

endmodule // semaphore_top