`timescale 1ns / 1ps

module semaphore_top (
    input CLK100MHZ,
    output wire clk_1hz,
    input wire buff_en,
    input wire[15:0] SW,
    output wire[4:0] LED,
    output wire LED17_R,
    output wire LED17_G,
    output wire LED17_B,
    output wire LED16_R,
    output wire LED16_G,
    output wire LED16_B
);
    // Define registers to store the outputs of traffic_buffer
    wire[3:0] sem0_car_num_reg;
    wire[3:0] sem0_people_num_reg;
    wire[3:0] sem1_car_num_reg;
    wire[3:0] sem1_people_num_reg;

    wire[1:0] state_traffic_light_0;
    wire[1:0] state_traffic_light_1;

    clock_divider dut2(.clock_in(CLK100MHZ),.clock_out(clk_1hz));

    // Instantiate traffic_buffer module
    traffic_buffer buffer_inst (
        .buff_en(buff_en),

        .SW(SW),

        .sem0_car_num_reg(sem0_car_num_reg),
        .sem0_people_num_reg(sem0_people_num_reg),
        .sem1_car_num_reg(sem1_car_num_reg),
        .sem1_people_num_reg(sem1_people_num_reg)
    );

    // Instantiate traffic_light module
    traffic_light_0 light_inst (
        .select(state_traffic_light_0), // Using only two LSBs of sem0_car_num_reg
        .PERSON_G(LED[0]),
        .PERSON_R(LED[1]),
        .CAR_R(LED17_R),
        .CAR_G(LED17_G),
        .CAR_B(LED17_B)
    );

    traffic_light_1 light_inst (
        .select(state_traffic_light_1), // Using only two LSBs of sem1_car_num_reg
        .PERSON_G(LED[2]),
        .PERSON_R(LED[3]),
        .CAR_R(LED16_R),
        .CAR_G(LED16_G),
        .CAR_B(LED16_B)
    );

    // Implement State Machine from here

endmodule // semaphore_top