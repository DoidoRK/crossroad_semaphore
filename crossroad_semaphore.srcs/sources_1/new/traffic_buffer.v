`timescale 1ns / 1ps

module traffic_buffer(

    input wire[7:0] switch_input,

    output wire[3:0] car_num,
    output wire[3:0] people_num
    );
    
    reg[3:0] car_num_reg;
    reg[3:0] people_num_reg;

    always @(*) begin
        car_num_reg <= switch_input[3:0];
        people_num_reg <= switch_input[7:4];
    end

    // Assign values from registers to output wires
    assign car_num = car_num_reg;
    assign people_num = people_num_reg;

endmodule //traffic_buffer