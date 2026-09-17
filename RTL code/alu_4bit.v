`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2026 13:50:05
// Design Name: 
// Module Name: alu_4bit
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


module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,
    output reg  [3:0] result,
    output reg        carry,
    output reg        zero
);

always @(*) begin

    // Default values
    result = 4'b0000;
    carry  = 1'b0;

    case (opcode)

        3'b000: begin
            // Addition
            {carry, result} = A + B;
        end

        3'b001: begin
            // Subtraction
            {carry, result} = A - B;
        end

        3'b010: begin
            // AND
            result = A & B;
        end

        3'b011: begin
            // OR
            result = A | B;
        end

        3'b100: begin
            // XOR
            result = A ^ B;
        end

        3'b101: begin
            // NOT A
            result = ~A;
        end

        3'b110: begin
            // Increment A
            {carry, result} = A + 1'b1;
        end

        3'b111: begin
            // Decrement A
            {carry, result} = A - 1'b1;
        end

        default: begin
            result = 4'b0000;
            carry  = 1'b0;
        end

    endcase

    // Zero flag
    if (result == 4'b0000)
        zero = 1'b1;
    else
        zero = 1'b0;

end

endmodule