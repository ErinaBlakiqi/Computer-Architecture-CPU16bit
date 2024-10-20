`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2024 03:52:37 PM
// Design Name: 
// Module Name: mux3n1
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


module mux3n1(
    input [15:0] Hyrja0, //Tjerat
    input [15:0] Hyrja1, //SLL
    input [15:0] Hyrja2, //SRA
    input [2:0] S,
    output [15:0] Dalja
    );
    
// 000 HYRJA0
// 001 HYRJA1
// 010 HYRJA2
// 011 HYRJA3
// 100 HYRJA4
// 101 HYRJA5
// 110 HYRJA6 SLL
// 111 HYRJA7 SRA

assign Dalja = S[2] ? (S[1]? (S[0] ? Hyrja2 : Hyrja1) : (S[0] ? Hyrja0 : Hyrja0)) : (S[1] ? (S[0] ? Hyrja0 : Hyrja0) : (S[0] ? Hyrja0 : Hyrja0));
endmodule
