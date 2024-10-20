//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 06:13:36 PM
// Design Name: 
// Module Name: Test_CPU
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


module Test_CPU();
reg Clock;
reg [15:0] i;


initial
begin
for(i=0; i < 30; i=i+1) //30x nderro nga Clock 0 - 1, 30 tehe pozitive
begin
#10 Clock = 0;
#10 Clock = 1;
end

#10 $stop;
end



CPU CPU16(Clock);
endmodule