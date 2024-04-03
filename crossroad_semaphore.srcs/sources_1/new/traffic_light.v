`timescale 1ns / 1ps

// Semaphore states:
// 2b'00 - green;
// 2b'01 - blue;
// 2b'10 - red;

module traffic_light(
    input [1:0] select,
    output reg PERSON_G,
    output reg PERSON_R,
    output reg CAR_R,
    output reg CAR_G,
    output reg CAR_B
    );

    always @(*) begin
        case (select)
            2'b00: begin    //  Traffic light is Green
                CAR_R = 0;
                CAR_G = 1;
                CAR_B = 0;
                PERSON_G = 0;
                PERSON_R = 1;
            end
            2'b01: begin    //  Traffic light is Yellow
                CAR_R = 0;
                CAR_G = 0;
                CAR_B = 1;
                PERSON_G = 0;
                PERSON_R = 1;
            end
            2'b10: begin    //  Traffic light is Red
                CAR_R = 1;
                CAR_G = 0;
                CAR_B = 0;
                PERSON_G = 1;
                PERSON_R = 0;
            end
            default: begin  //  If an unexpected behaviour occurs, the traffic light is set to red
                CAR_R = 1;
                CAR_G = 0;
                CAR_B = 0;
                PERSON_G = 1;
                PERSON_R = 0;
            end
        endcase
    end    
    
endmodule //traffic_light