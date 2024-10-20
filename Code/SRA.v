`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2024 05:47:48 PM
// Design Name: 
// Module Name: SRA
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


module SRA(
    input [15:0] A,
    input [3:0] SHAMT,
    output [15:0] OutputSRA
    );
    reg [15:0] result;
    integer i;

    always@* begin
        result = (A[15] == 1) ? {16{1'b1}} : {16{1'b0}}; 

        for (i = 0; i < 16; i = i + 1) begin
            if (i + SHAMT < 16) begin
                result[i] = A[i + SHAMT];
            end
        end
    end

    assign OutputSRA = result;
endmodule
