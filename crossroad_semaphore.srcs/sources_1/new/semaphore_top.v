`timescale 1ns / 1ps

module semaphore_top (
    input wire buff_en,
    input wire [4:0] sem0_car_wire,
    input wire [4:0] sem0_people_wire,
    input wire [4:0] sem1_car_wire,
    input wire [4:0] sem1_people_wire,
    output wire [4:0] lights
);
    // Define registers to store the outputs of traffic_buffer
    wire [4:0] sem0_car_num_reg;
    wire [4:0] sem0_people_num_reg;
    wire [4:0] sem1_car_num_reg;
    wire [4:0] sem1_people_num_reg;

    // Instantiate traffic_buffer module
    traffic_buffer buffer_inst (
        .buff_en(buff_en),
        .sem0_car_wire(sem0_car_wire),
        .sem0_people_wire(sem0_people_wire),
        .sem1_car_wire(sem1_car_wire),
        .sem1_people_wire(sem1_people_wire),

        .sem0_car_num_reg(sem0_car_num_reg),
        .sem0_people_num_reg(sem0_people_num_reg),
        .sem1_car_num_reg(sem1_car_num_reg),
        .sem1_people_num_reg(sem1_people_num_reg)
    );

    // Instantiate traffic_light module
    traffic_light light_inst (
        .select(sem0_car_num_reg[1:0]), // Using only two LSBs of sem0_car_num_reg
        .lights(lights)
    );


endmodule // semaphore_top