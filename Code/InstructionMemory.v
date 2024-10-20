`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2024 01:19:32 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [15:0] PCAddress,
    output [15:0] Instruction
    );

reg[7:0] instrMem[127:0];

initial
$readmemb("instructMemory.mem", instrMem);


assign Instruction[15:8] = instrMem[PCAddress];
assign Instruction[7:0] = instrMem[PCAddress + 16'd1];
endmodule
