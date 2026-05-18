`timescale 1ns/1ps

module alu_tb;

  reg  [3:0] A, B;
  reg  [2:0] opcode;
  wire [3:0] result;

  alu_4bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
  );

  initial begin
    $dumpfile("simulation/alu.vcd");
    $dumpvars(0, alu_tb);
  end

  initial begin
    $display("           ALU TESTBENCH                  ");
    $display(" TIME | OPCODE |  A   |  B   | RESULT ");
  end

  initial begin
    $monitor(" %3t  |  %b   | %b | %b | %b",
              $time, opcode, A, B, result);
  end

  initial begin

    
    // ADD opcode = 000
    

    // Test 1: 3 + 4 = 7
    A = 4'd3;  B = 4'd4;  opcode = 3'b000; #10;

    // Test 2: 0 + 0 = 0
    A = 4'd0;  B = 4'd0;  opcode = 3'b000; #10;

    // Test 3: 7 + 1 = 8
    A = 4'd7;  B = 4'd1;  opcode = 3'b000; #10;

    // Test 4: 15 + 1 = 0 (wraps around)
    A = 4'd15; B = 4'd1;  opcode = 3'b000; #10;

   
    // SUB opcode = 001
    

    // Test 5: 5 - 3 = 2
    A = 4'd5;  B = 4'd3;  opcode = 3'b001; #10;

    // Test 6: 4 - 4 = 0
    A = 4'd4;  B = 4'd4;  opcode = 3'b001; #10;

    // Test 7: 2 - 5 (negative result)
    A = 4'd2;  B = 4'd5;  opcode = 3'b001; #10;

  
    // AND opcode = 010


    // Test 8: 1010 & 1100 = 1000
    A = 4'b1010; B = 4'b1100; opcode = 3'b010; #10;

    // Test 9: 1111 & 1111 = 1111
    A = 4'b1111; B = 4'b1111; opcode = 3'b010; #10;

    // Test 10: 1111 & 0000 = 0000
    A = 4'b1111; B = 4'b0000; opcode = 3'b010; #10;

    // Test 11: 0101 & 1010 = 0000 (no bits same)
    A = 4'b0101; B = 4'b1010; opcode = 3'b010; #10;

   // OR opcode = 011
  

    // Test 12: 1010 | 0101 = 1111
    A = 4'b1010; B = 4'b0101; opcode = 3'b011; #10;

    // Test 13: 0000 | 0000 = 0000
    A = 4'b0000; B = 4'b0000; opcode = 3'b011; #10;

    // Test 14: 1100 | 0011 = 1111
    A = 4'b1100; B = 4'b0011; opcode = 3'b011; #10;

    // Test 15: 1000 | 0000 = 1000
    A = 4'b1000; B = 4'b0000; opcode = 3'b011; #10;


    // NOT opcode = 100 (B is ignored)

    // Test 16: ~0000 = 1111
    A = 4'b0000; B = 4'b0000; opcode = 3'b100; #10;

    // Test 17: ~1111 = 0000
    A = 4'b1111; B = 4'b0000; opcode = 3'b100; #10;

    // Test 18: ~1010 = 0101
    A = 4'b1010; B = 4'b0000; opcode = 3'b100; #10;

    // Test 19: ~0001 = 1110
    A = 4'b0001; B = 4'b0000; opcode = 3'b100; #10;

    // Test 20: B ignored in NOT
    A = 4'b1010; B = 4'b1111; opcode = 3'b100; #10;

   
    $display(" All  20 tests complete");

    $finish;
  end

endmodule