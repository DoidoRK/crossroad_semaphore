`timescale 1ns / 1ps

module state_machine(
    input clk, //clock do tempo real (segundo)
    input wire[3:0] sem_0_car_num,
    input wire[3:0] sem_1_car_num,
    input wire[3:0] sem_0_people_num,
    input wire[3:0] sem_1_people_num,
    output reg[1:0] sem_0_state,
    output reg[1:0] sem_1_state
);

reg[1:0] phase = 0;
reg[9:0] time_counter = 2;
reg[9:0] sem_0_deviation = 0;
reg[9:0] sem_1_deviation = 0;
reg[3:0] sem_0_car_num_reg;
reg[3:0] sem_1_car_num_reg;
reg[3:0] sem_0_people_num_reg;
reg[3:0] sem_1_people_num_reg;

reg[1:0] sem_0_state_reg;
reg[1:0] sem_1_state_reg;

//  Variables to define timings
reg[9:0] phase_0_time = 33;
reg[9:0] phase_1_time = 10;
reg[9:0] phase_2_time = 33;
reg[9:0] phase_default_time = 10;


always @(posedge clk) begin
    if (time_counter == 0) begin
        case (phase)
            1: begin phase <= 2; time_counter <= phase_0_time; phase_2_time <= 33 + sem_0_deviation; end
            2: begin phase <= 3; time_counter <= phase_1_time; end
            3: begin phase <= 0; time_counter <= phase_2_time; phase_0_time <= 33 + sem_1_deviation; end
            default: begin phase <= 1; time_counter <= phase_default_time; end
        endcase
    end else begin
        time_counter <= time_counter - 1;
    end
end

always @(posedge clk) begin
    sem_0_car_num_reg = sem_0_car_num;
    sem_1_car_num_reg = sem_1_car_num;
    sem_0_people_num_reg = sem_0_people_num;
    sem_1_people_num_reg = sem_1_people_num;
    
    sem_1_deviation = sem_1_car_num_reg - sem_1_people_num_reg - sem_0_car_num_reg + sem_0_people_num_reg;
    sem_0_deviation = sem_0_car_num_reg - sem_0_people_num_reg - sem_1_car_num_reg + sem_1_people_num_reg;
end

always @(negedge clk) begin
    case (phase)
        0: sem_0_state = 2'b00;
        1: sem_0_state = 2'b01;
        2: sem_0_state = 2'b10;
        default: sem_0_state = 2'b10;
    endcase

    case (phase)
        0: sem_1_state = 2'b10;
        1: sem_1_state = 2'b10;
        2: sem_1_state = 2'b00;
        default: sem_1_state = 2'b01;
    endcase
end

endmodule // controle