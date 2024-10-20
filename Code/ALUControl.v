`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2024 12:51:43 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(

 input [1:0] ALUOp,
    input [1:0] FUNCT,
    input [3:0] OPCode,
    output reg [3:0] Operacioni
    );
    
always @(ALUOp)
begin
case(ALUOp) 
//sw+lw dhe beq+bne ALUOp = 00 dhe 01
    2'b00: Operacioni = 4'b0100; //lwAPOsw behet permes operacionit te mbledhjes
    2'b01: Operacioni = 4'b1100; //beqAPObne behet permes operacioni te zbritjes
//R-format
    2'b10:   
    case(OPCode)
        4'b0000:
            case(FUNCT)
                2'b00: Operacioni = 4'b0000; //AND
                2'b01: Operacioni = 4'b0010; //OR
                2'b10: Operacioni = 4'b0011; //XOR
             endcase 
        4'b0001:
            case(FUNCT)
                2'b00: Operacioni = 4'b0100; //ADD
                2'b01: Operacioni = 4'b1100; //SUB
             endcase
        4'b0010:
            case(FUNCT)
                2'b00: Operacioni = 4'b0110; //SLL
                2'b01: Operacioni = 4'b0111; //SRA
             endcase           
     endcase    
//I-format
     2'b11:   
     case(OPCode)
        4'b1001: Operacioni = 4'b0100; //ADDI
        4'b1010: Operacioni = 4'b1100; //SUBI
        4'b1011: Operacioni = 4'b0001; //SLTI            
     endcase       
endcase
end
endmodule
