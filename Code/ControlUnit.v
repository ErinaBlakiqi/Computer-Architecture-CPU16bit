`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2024 01:25:53 PM
// Design Name: 
// Module Name: Control_Unit
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


module ControlUnit(

 input [3:0] OPCode,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg[1:0] ALUOp,
    output reg Branch
    );
    
    always @ (OPCode)
    begin    
        case(OPCode)
        //R-FORMAT
        4'b0000: //AND, OR, XOR
            begin
            RegDst = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 0;
            Branch = 0;
            end 
            
        4'b0001: //SUB, ADD
            begin
            RegDst = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 0;
            Branch = 0;
            end 
              
        4'b0010: //SLL, SRA
            begin
            RegDst = 1;
            ALUSrc = 1'bX;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 0;
            Branch = 0;
            end  
            
        //I-FORMAT
        4'b1001: //ADDI
            begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 1;
            Branch = 0;
            end    
        4'b1010: //SUBI
            begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 1;
            Branch = 0;
            end   
        4'b1011: //SLTI
            begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 1;
            Branch = 0;
            end   
             
        //INSTRUKSIONET MEMORIKE
        4'b1100: //LW
            begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
            Branch = 0;
            end    
        4'b1101: //SW
            begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
            Branch = 0;
            end    

        //INSTRUKSIONET E DEGEZIMIT
        4'b1111: //BEQ
            begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 1;
            Branch = 1;
            end    
                          
    endcase
    end
endmodule

