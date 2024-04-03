`timescale 1ns / 1ps

module traffic_buffer(
    input wire buff_en,

    input wire[15:0] SW,

    output reg[3:0] sem0_car_num_reg,
    output reg[3:0] sem0_people_num_reg,
    output reg[3:0] sem1_car_num_reg,
    output reg[3:0] sem1_people_num_reg
    );

    always @(posedge buff_en) begin
        sem0_car_num_reg[0] <= SW[0];
        sem0_car_num_reg[1] <= SW[1];
        sem0_car_num_reg[2] <= SW[2];
        sem0_car_num_reg[3] <= SW[3];

        sem0_people_num_reg[0] <= SW[4];
        sem0_people_num_reg[1] <= SW[5];
        sem0_people_num_reg[2] <= SW[6];
        sem0_people_num_reg[3] <= SW[7];

        sem1_car_num_reg[0] <= SW[8];
        sem1_car_num_reg[1] <= SW[9];
        sem1_car_num_reg[2] <= SW[10];
        sem1_car_num_reg[3] <= SW[11];

        sem1_people_num_reg[0] <= SW[12];
        sem1_people_num_reg[1] <= SW[13];
        sem1_people_num_reg[2] <= SW[14];
        sem1_people_num_reg[3] <= SW[15];
    end
endmodule //traffic_buffer

