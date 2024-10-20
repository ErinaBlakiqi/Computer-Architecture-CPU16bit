//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 06:09:57 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(

 input Clock,  //hyrje nga cpu- CPU_IN_1
	 input RegDst, Branch, MemRead, MemToReg, MemWrite,
	 ALUSrc, RegWrite,				//hyrjet nga CU
	 input[1:0] ALUOp,				//hyrje nga CU
	 output[3:0] opcode			//dalje per ne CU
	
	 );

reg[15:0] pc_initial;			//regjistri i pc

wire[15:0] pc_next, pc_2, pc_beq;					//telat t1, t2, t3-ndryshimi i vlerave tek pc
wire[15:0] instruction;								//teli t5- instruksioni nga instruction memory
wire[1:0] mux_reg;									//teli t6- write register ne register file
wire[15:0] readData1, readData2, writeData;			//telat t7, t8, t9- hyrja dhe daljet 16 bitche nga register file
wire[15:0] mux_ALU, ALU_out, extension, DM_mux;		//telat t10, t11, t12, t13
wire[15:0] shifterbeq, branchAdderMux, beqAddress; 	//telat t14, t15, t17 (t18 sherben per funksionin jump)
wire[3:0] ALUControl;								//teli t19-mes ALUControl dhe ALU
wire zerof, overflow, carryout;						//telat t20, t21, t22
wire andMuxBranch;									//teli t23
wire [3:0] opcode;

initial
begin
    pc_initial = 16'd11; //inicializimi fillesar i PC ne adresen 11
end

always@(posedge Clock)
begin
    pc_initial <= pc_beq; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
    
end

//T2 - PC rritet per 2 (ne sistemet 16 biteshe) per te gjitha instruksionet pervec BEQ, BNE, JUMP
assign pc_2= pc_initial + 2;

//t14 - pergatitja e adreses per kercim ne BEQ (164 bit si MSB, 16 bit nga pjesa imediate, 2 bit shtyrje majtas (x4)) 
assign shifterbeq = {{7{instruction[7]}}, instruction[7:0], 1'b0};

//t15- teli per adresen e operacionit te jump (nuk perdoret)

//Instr mem - inicializimi i IM (PC adresa hyrje, teli instruction dajle)
InstructionMemory InstrMem(pc_initial, instruction); 

//t6 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1 ne foto
assign mux_reg = (RegDst == 1'b1) ? instruction[7:6] : instruction[9:8]; 

// t12 - Zgjerimi nga 8 ne 16 bit - 8 bit si MSB dhe pjesa e instruction[7:0] - S1 ne foto
assign extension = {{8{instruction[7]}}, instruction[7:0]};  

//REGISTER FILE
//inicializimi i RF(RS, RT, t6-RD[RD=RD || RD=RT], t9-WriteData, RegWrite, Clock, t7, t8)
RegisterFile RF(instruction[11:10], instruction[9:8], mux_reg, writeData, RegWrite, Clock, readData1, readData2);

//t10 - Percaktimi nese hyrja e multiplekserit M2 para ALU eshte regjistri i dyte-t8 apo vlera imediate e instruksionit-t12 
assign mux_ALU = (ALUSrc == 1'b1) ? extension : readData2; 

//ALU CONTROL
//inicializimi i ALU Control (ALUOp, Funct, Opcode, Operacioni-t19) 
ALUControl AC(ALUOp, instruction[1:0], instruction[15:12], ALUControl); 

//ALU
//inicializimi i ALU (t7, t10, Operacioni-t19[2:0], t19[3], zerof-t20, Overflow-t21, CarryOut-t22, Result-t11)
ALU_w_BonusOp ALU (readData1, mux_ALU, ALUControl[2:0], ALUControl[3], instruction[5:2], zerof, overflow, carryout, ALU_out);

//DATA MEMORY
//inicializimi i Data Memory (Address-t11, WriteData-t8, MemWrite, MemRead, Clock, ReadData-t13) 
DataMemory DM(ALU_out, readData2, MemWrite, MemRead, Clock, DM_mux);

//t9 - Teli qe i dergon te dhenat nga multiplekseri - M3 ne Regfile
assign writeData = (MemToReg == 1'b1) ? DM_mux : ALU_out;

//t23 - Teli qe del nga porta DHE per ALU dhe Branch (shikon nese plotesohet kushti per BEQ)
assign andMuxBranch = zerof & Branch;

//t17, Teli qe mban adresen ne te cilen do te kapercej programi kur kushti BEQ plotesohet
assign beqAddress = pc_2 + shifterbeq; 

//t3 - Teli qe del nga multiplekseri M4 qe kontrollon nese kemi BEQ apo PC+4
assign pc_beq = (andMuxBranch == 1'b1) ? beqAddress : pc_2;

//t18 - Teli qe tregon adresen pas operacionit jump (nuk e tregojme)

//Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[15:12];


endmodule
