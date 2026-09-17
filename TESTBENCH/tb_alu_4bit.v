`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2026 14:22:21
// Design Name: 
// Module Name: tb_alu_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb_alu_4bit;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;

    wire [3:0] result;
    wire       carry;
    wire       zero;

    // Instantiate ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    initial begin

        // Addition
        A = 4'b0101;
        B = 4'b0011;
        opcode = 3'b000;
        #10;

        // Subtraction
        A = 4'b0101;
        B = 4'b0011;
        opcode = 3'b001;
        #10;

        // AND
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b010;
        #10;

        // OR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b011;
        #10;

        // XOR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b100;
        #10;

        // NOT
        A = 4'b1010;
        B = 4'b0000;
        opcode = 3'b101;
        #10;

        // Increment
        A = 4'b0111;
        B = 4'b0000;
        opcode = 3'b110;
        #10;

        // Decrement
        A = 4'b0111;
        B = 4'b0000;
        opcode = 3'b111;
        #10;

        $finish;

    end

endmodule