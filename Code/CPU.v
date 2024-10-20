`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 06:11:22 PM
// Design Name: 
// Module Name: CPU
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


module CPU(input Clock);

//Telat e brendshem ne CPU
wire [3:0] opcode;

//Telat qe dalin nga CU
wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch;
wire [1:0] ALUOp;

//Inicializimi i Datapath
Datapath DP(
	Clock,
	RegDst, 
	Branch, 
	MemRead, 
	MemToReg, 
	MemWrite, 
	ALUSrc, 
	RegWrite,
	ALUOp,
	opcode
);

//Inicializimi i Control Unit
ControlUnit CU(
	opcode,
	RegDst,
	ALUSrc,
	MemToReg,
	RegWrite,
	MemRead,
	MemWrite,
	ALUOp,
	Branch
);

endmodule
