`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 07:05:37 PM
// Design Name: 
// Module Name: mux2n1
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


module mux2n1(
    input Hyrja0,
    input Hyrja1,
    input S,
    output Dalja
    );
    
    assign Dalja = S ? Hyrja1 : Hyrja0;
endmodule
