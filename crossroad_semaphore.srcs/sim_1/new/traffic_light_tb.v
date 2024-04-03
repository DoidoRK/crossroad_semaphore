`timescale 1ns / 1ps

module traffic_light_tb;

    //Inputs
    reg[1:0] select;

    //Outputs
    wire PERSON_G;
    wire PERSON_R;
    wire CAR_R;
    wire CAR_G;
    wire CAR_B;
    
    // Instantiate the traffic_light module
    traffic_light light_inst (
        .select(select), // Using only two LSBs of sem0_car_num_reg
        .PERSON_G(PERSON_G),
        .PERSON_R(PERSON_R),
        .CAR_R(CAR_R),
        .CAR_G(CAR_G),
        .CAR_B(CAR_B)
    );

    // Stimulus
    initial begin
        $monitor("Time=%0t, Select=%b, Lights=%b", $time, select, PERSON_G,PERSON_R,CAR_R,CAR_G,CAR_B);
        
        select = 2'b00;

        repeat (10) begin
            #1; // Wait for 5 nanoseconds
            select = select + 2'b01; // Increment select value
        end

        // End simulation
        $finish;
    end

endmodule // traffic_light_tb
