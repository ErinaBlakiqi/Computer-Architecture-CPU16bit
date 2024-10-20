`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 07:09:02 PM
// Design Name: 
// Module Name: mux8n1
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


module mux8n1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input Hyrja4,
    input Hyrja5,
    input Hyrja6,
    input Hyrja7,
    input [2:0] S,
    output Dalja
    );

// 000 HYRJA0
// 001 HYRJA1
// 010 HYRJA2
// 011 HYRJA3
// 100 HYRJA4
// 101 HYRJA5
// 110 HYRJA6
// 111 HYRJA7

assign Dalja = S[2] ? (S[1]? (S[0] ? Hyrja7 : Hyrja6) : (S[0] ? Hyrja5 : Hyrja4)) : (S[1] ? (S[0] ? Hyrja3 : Hyrja2) : (S[0] ? Hyrja1 : Hyrja0));
endmodule