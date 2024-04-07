`timescale 1ns / 1ps

// Semaphore states:
// 2b'00 - green;
// 2b'01 - blue;
// 2b'10 - red;

module traffic_light(
    input [1:0] select,
    output reg person_g,
    output reg person_r,
    output reg car_r,
    output reg car_g,
    output reg car_b
    );

    always @(*) begin
        case (select)
            2'b00: begin    //  Traffic light is Green
                car_r = 0;
                car_g = 1;
                car_b = 0;
                person_g = 0;
                person_r = 1;
            end
            2'b01: begin    //  Traffic light is Yellow
                car_r = 0;
                car_g = 0;
                car_b = 1;
                person_g = 0;
                person_r = 1;
            end
            2'b10: begin    //  Traffic light is Red
                car_r = 1;
                car_g = 0;
                car_b = 0;
                person_g = 1;
                person_r = 0;
            end
            default: begin  //  If an unexpected behavior occurs, the traffic light is set to red
                car_r = 1;
                car_g = 0;
                car_b = 0;
                person_g = 1;
                person_r = 0;
            end
        endcase
    end    
    
endmodule //traffic_light