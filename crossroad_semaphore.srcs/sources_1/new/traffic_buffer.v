`timescale 1ns / 1ps

module traffic_buffer(
    input wire buff_en,

    input wire[4:0] sem0_car_wire, 
    input wire[4:0] sem0_people_wire, 
    input wire[4:0] sem1_car_wire, 
    input wire[4:0] sem1_people_wire,

    output reg[4:0] sem0_car_num_reg,
    output reg[4:0] sem0_people_num_reg,
    output reg[4:0] sem1_car_num_reg,
    output reg[4:0] sem1_people_num_reg
    );

    always @(posedge buff_en) begin
        sem0_car_num_reg <= sem0_car_wire;
        sem0_people_num_reg <= sem0_people_wire;
        sem1_car_num_reg <= sem1_car_wire;
        sem1_people_num_reg <= sem1_people_wire;
    end
endmodule //traffic_buffer

