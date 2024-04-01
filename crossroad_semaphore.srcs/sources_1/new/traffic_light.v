`timescale 1ns / 1ps

// Semaphore states:
// 2b'00 - green;
// 2b'01 - blue;
// 2b'10 - red;

// Bit meaning:
// lights[0] = car green_led
// lights[1] = car blue_led
// lights[2] = car red_led
// lights[3] = pedestrian green_led
// lights[4] = pedestrian red_led

module traffic_light(
    input [1:0] select,
    output reg[4:0] lights
    );

    always @(*) begin
        case (select)
            2'b00: lights <= 5'b10001;  //Traffic light green, pedestrian red
            2'b01: lights <= 5'b10010;  //Traffic light yellow, pedestrian red
            2'b10: lights <= 5'b01100;  //Traffic light red, pedestrian green
            default: lights <= 5'b01100; //Traffic light red, pedestrian green (if something goes wrong, defaults to red)
        endcase
    end    
    
endmodule //traffic_light