`timescale 1ns / 1ps

module semaphore_top_tb;

    // Inputs
    reg CLK100MHZ;
    reg[15:0] SW;
    
    // Outputs

    // Semaphore 0
    // LED[0] - PERSON_G
    // LED[1] - PERSON_R
    wire LED17_R;
    wire LED17_G;
    wire LED17_B;

    // Semaphore 1
    // LED[2] - PERSON_G
    // LED[3] - PERSON_R
    wire LED16_R;
    wire LED16_G;
    wire LED16_B;
    
    wire[4:0] LED;
    
    // Top module instance
    semaphore_top dut (
        .CLK100MHZ(CLK100MHZ),
        .SW(SW),
        .LED(LED),
        .LED17_R(LED17_R),
        .LED17_G(LED17_G),
        .LED17_B(LED17_B),
        .LED16_R(LED16_R),
        .LED16_G(LED16_G),
        .LED16_B(LED16_B)
    );

    // Clock generation
    always #5 CLK100MHZ = ~CLK100MHZ; // Toggle clock every 5 ns (period of 100MHz)

    //  Changes input values every clock posedge
    always @(posedge CLK100MHZ) begin
        SW = SW + 16'b0001000100010001; // Increment SW value
    end

    // Stimulus
    initial begin
        // Initialize clock
        CLK100MHZ = 0;

        // Initialize SW
        SW = 16'b0000000000000000;
    end

endmodule // semaphore_top_tb