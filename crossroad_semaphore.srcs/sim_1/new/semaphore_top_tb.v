`timescale 1ns / 1ps

module semaphore_top_tb;

  // Inputs
  reg clk;
  reg [3:0] sem_0_car_num;
  reg [3:0] sem_1_car_num;
  reg [3:0] sem_0_people_num;
  reg [3:0] sem_1_people_num;
  wire [1:0] sem_0_state;
  wire [1:0] sem_1_state;

  //Semaphore instance
  semaphore_top dut (
    .CLK100MHZ,
    .SW(),
    .LED(),
    .LED17_R(),
    .LED17_G(),
    .LED17_B(),
    .LED16_R(),
    .LED16_G(),
    .LED16_B()
  );

  // Clock generation
  initial begin
    clk = 0;
    sem_0_people_num = 2;
    sem_1_people_num = 14;
    sem_0_car_num = 15;
    sem_1_car_num = 1;
    forever #2 clk = ~clk; // Invert clock every 5 time units to generate a 100MHz clock
  end

endmodule // semaphore_top_tb