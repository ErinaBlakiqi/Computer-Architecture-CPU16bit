`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2024 01:45:00 AM
// Design Name: 
// Module Name: ALU16
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



module ALU16(

 input [15:0] A,
    input [15:0] B,
    input [2:0] Operacioni,
    input BNegate,
    output Zero,
    output Overflow,
    output CarryOut,
    output [15:0] Result
    );
 
wire [14:0] COUT; //se e kena 1 ma pak kur te qesim    
ALU1 ALU0(A[0], B[0], Result[15], BNegate, BNegate, Operacioni, Result[0], COUT[0]);
ALU1 ALU1(A[1], B[1], 0, COUT[0], BNegate, Operacioni, Result[1], COUT[1]); 
ALU1 ALU2(A[2], B[2], 0, COUT[1], BNegate, Operacioni, Result[2], COUT[2]);  
ALU1 ALU3(A[3], B[3], 0, COUT[2], BNegate, Operacioni, Result[3], COUT[3]); 
ALU1 ALU4(A[4], B[4], 0, COUT[3], BNegate, Operacioni, Result[4], COUT[4]); 
ALU1 ALU5(A[5], B[5], 0, COUT[4], BNegate, Operacioni, Result[5], COUT[5]); 
ALU1 ALU6(A[6], B[6], 0, COUT[5], BNegate, Operacioni, Result[6], COUT[6]); 
ALU1 ALU7(A[7], B[7], 0, COUT[6], BNegate, Operacioni, Result[7], COUT[7]); 
ALU1 ALU8(A[8], B[8], 0, COUT[7], BNegate, Operacioni, Result[8], COUT[8]); 
ALU1 ALU9(A[9], B[9], 0, COUT[8], BNegate, Operacioni, Result[9], COUT[9]); 
ALU1 ALU10(A[10], B[10], 0, COUT[9], BNegate, Operacioni, Result[10], COUT[10]); 
ALU1 ALU11(A[11], B[11], 0, COUT[10], BNegate, Operacioni, Result[11], COUT[11]); 
ALU1 ALU12(A[12], B[12], 0, COUT[11], BNegate, Operacioni, Result[12], COUT[12]); 
ALU1 ALU13(A[13], B[13], 0, COUT[12], BNegate, Operacioni, Result[13], COUT[13]); 
ALU1 ALU14(A[14], B[14], 0, COUT[13], BNegate, Operacioni, Result[14], COUT[14]); 
ALU1 ALU15(A[15], B[15], 0, COUT[14], BNegate, Operacioni, Result[15], CarryOut); 

assign Zero = ~(Result[0] | Result[1] | 
                Result[2] | Result[3] | 
                Result[4] | Result[5] |
                Result[6] | Result[7] | 
                Result[8] | Result[9] | 
                Result[10] | Result[11] | 
                Result[12] | Result[13] | 
                Result[14] | Result[15]);
//overflow deteektohet kur carry in edhe carry out te bitit most significant jane ndryshe                
assign Overflow = COUT[14] ^ CarryOut;
//XOR kur carryin me carryout jon ndryshe del 1 i bjen qe overflow
endmodule
