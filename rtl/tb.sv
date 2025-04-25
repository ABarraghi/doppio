`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Juniata College
// Engineer: Arman Barraghi Zadeh
// 
// Create Date: 04/10/2025 10:53:39 AM
// Design Name: Doppio Module Testbench
// Module Name: tb
// Project Name: doppio_gui
// Target Devices: Artix A7
// Tool Versions: 
// Description: Testbench module for both the Aggregator and MMU unit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////
module tb();
parameter N = 3;

//Inputs
logic D_CLK, D_OFF;

//Outputs
logic [0:63] BIN_OUT [0:3];
logic [0:63] OUT;
logic LED_0, LED_1, LED_2;
int CUR_IDX;

//Designs Under Tests
aggregator dut1(.BIN_OUT (BIN_OUT) );

mmu dut2(.D_CLK (D_CLK),
         .D_OFF (D_OFF),
         .OUT (OUT),
         .LED_0 (LED_0),
         .LED_1 (LED_1),
         .LED_2 (LED_2)
         );
         
//top dut3(.CLK (CLK),
//         .D_OFF (D_OFF),
//         .IN (OUT),
//         .LED_0 (LED_0),
//         .LED_1 (LED_1),
//         .LED_2 (LED_2)
//         );

// Clock generation
always #5 D_CLK = ~D_CLK;

initial begin
    
    // Initialize MMU Inputs
    D_CLK = 0;
    D_OFF = 0;
    
    //--------------------- Testing CUR_IDX and equality ---------------------
    
    CUR_IDX = 0;
    $display("CUR_IDX == 0 ? %b", CUR_IDX == 0);
    $display("CUR_IDX == 1 ? %b", CUR_IDX == 1);
    $display("CUR_IDX == 2 ? %b", CUR_IDX == 2);
    $display("CUR_IDX == 3 ? %b", CUR_IDX == 3);
    @ (posedge D_CLK);
    CUR_IDX = 1;
    $display("CUR_IDX == 0 ? %b", CUR_IDX == 0);
    $display("CUR_IDX == 1 ? %b", CUR_IDX == 1);
    $display("CUR_IDX == 2 ? %b", CUR_IDX == 2);
    $display("CUR_IDX == 3 ? %b", CUR_IDX == 3);
    @ (posedge D_CLK);
    CUR_IDX = 2;
    $display("CUR_IDX == 0 ? %b", CUR_IDX == 0);
    $display("CUR_IDX == 1 ? %b", CUR_IDX == 1);
    $display("CUR_IDX == 2 ? %b", CUR_IDX == 2);
    $display("CUR_IDX == 3 ? %b", CUR_IDX == 3);
    @ (posedge D_CLK);
    CUR_IDX = 3;
    $display("CUR_IDX == 0 ? %b", CUR_IDX == 0);
    $display("CUR_IDX == 1 ? %b", CUR_IDX == 1);
    $display("CUR_IDX == 2 ? %b", CUR_IDX == 2);
    $display("CUR_IDX == 3 ? %b", CUR_IDX == 3);
    
    //------------------------------------------------------------------------
    
    
    // -------------------- Testing Aggregator Unit -------------------- 
    //for(int i = 0; i < 4; i++) begin
    //    $display("Cur stream: %b", BIN_OUT[i]);
    //    $display("Random number: %d", $urandom_range(0,3));
    //    $display("Random stream: %b", BIN_OUT[$urandom_range(0,3)]);
    //end
    // ----------------------------------------------------------------- 
    
    // -------------------- Testing Memory Management Unit and Top -------------------- 
    
    // Test with D_OFF false
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);

    // Test with D_OFF true
    //D_OFF = 1;
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);
    //@(posedge D_CLK);
    //$display("OUT: %b, LED_0: %b,  LED_1: %b,  LED_2: %b", OUT, LED_0, LED_1, LED_2);

    $finish;
    
    // ------------------------------------------------------------------------------- 
    
end

endmodule