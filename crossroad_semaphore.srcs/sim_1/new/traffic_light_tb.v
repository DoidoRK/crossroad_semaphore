`timescale 1ns / 1ps

module traffic_light_tb;

    //Inputs
    reg[1:0] select;

    //Outputs
    wire person_g;
    wire person_r;
    wire car_r;
    wire car_g;
    wire car_b;
    
    // Instantiate the traffic_light module
    traffic_light light_inst (
        .select(select), // Using only two LSBs of sem0_car_num_reg
        .person_g(person_g),
        .person_r(person_r),
        .car_r(car_r),
        .car_g(car_g),
        .car_b(car_b)
    );

    // Stimulus
    initial begin
        $monitor("Time=%0t, Select=%b, Lights=%b", $time, select, person_g,person_r,car_r,car_g,car_b);
        
        select = 2'b00;

        repeat (10) begin
            #1; // Wait for 5 nanoseconds
            select = select + 2'b01; // Increment select value
        end

        // End simulation
        $finish;
    end

endmodule // traffic_light_tb
