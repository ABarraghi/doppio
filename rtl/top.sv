`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 06:53:44 PM
// Design Name: 
// Module Name: top
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


module top(input logic D_OFF,
           input logic D_CLK, 
           output logic LED_0,
           output logic LED_1,
           output logic LED_2
           );
           
    //Set OUT as an internal signal
    logic [0:63] OUT;
    
    mmu doppio( .D_OFF (D_OFF) ,
                .D_CLK (D_CLK) ,
                .OUT (OUT) ,
                .LED_0 (LED_0) ,
                .LED_1 (LED_1) ,
                .LED_2 (LED_2)
               );
endmodule
