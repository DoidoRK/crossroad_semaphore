`timescale 1ns / 1ps

// Simulation scenario:
// Semaphore 0:
// 2 Car
// 15 people
// Semaphore 1:
// 1 Car
// 14 people


module semaphore_top_tb;

  // Inputs
  reg CLK100MHZ;
  reg[15:0] SW;
  wire[3:0] LED;
  wire LED17_R;
  wire LED17_G;
  wire LED17_B;
  wire LED16_R;
  wire LED16_G;
  wire LED16_B;

  //Semaphore instance
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

  always #1 CLK100MHZ = ~CLK100MHZ; // For simulation purposes

  // Clock generation
  initial begin
    CLK100MHZ = 0;
    SW = 16'b1110000111110010;
  end

endmodule // semaphore_top_tb