`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 07:19:17 PM
// Design Name: 
// Module Name: ALU1
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


module ALU1(

   input A,
    input B,
    input LESS, 
    input CIN,
    input BInvert,
    input [2:0] Operation,
    output Result,
    output COUT
    );
//telat e kan emrin prej ku dalin

wire JoB, mA, mB, Dhe, Ose, XOR, Mbledhesi, SLTIT, SLLT, SRAT;

assign JoB = ~B;
//moduli emri(parametrat)
mux2n1 muxB(b, JoB, BInvert, mB);

assign Dhe = A & mB;
assign Ose = A | mB;
assign XOR = A ^ mB;

Mbledhesi1bit Adder(A, mB, CIN, Mbledhesi, COUT);
assign SLTIT = A < mB ? 1:0;

mux8n1 muxALU(Dhe, SLTIT, Ose, XOR, Mbledhesi, LESS, SLLT, SRAT, Operation, Result);
endmodule
