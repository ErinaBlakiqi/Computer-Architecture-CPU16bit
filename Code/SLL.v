`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2024 05:46:53 PM
// Design Name: 
// Module Name: SLL
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


module SLL(
    input [15:0] A,
    input [3:0] SHAMT,
    output [15:0] OutputSLL
    );
    
    reg [15:0] result;
    integer i;

    always@* begin
        result = 16'b0; // nfillim i bojna krejt me 0

        for (i = 0; i < 16; i = i + 1) begin
            if (i + SHAMT < 16) begin
                result[i + SHAMT] = A[i];
            end
        end
    end

    assign OutputSLL = result;
endmodule
