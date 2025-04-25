`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Juniata College
// Engineer: Arman Barraghi Zadeh
// 
// Create Date: 04/07/2025 03:03:00 PM
// Design Name: Doppio Aggregagator Unit
// Module Name: aggregator
// Project Name: doppio_gui
// Target Devices: Artix A7 
// Tool Versions: 
// Description: Aggregator unit collecting streams of different processor inputs.
// As a simple abstraction, in this first version the processor streams are taken from a file, cores.dat
// Then output as multiple different binary streams. 
// 
// Dependencies: 
// 
// Revision: 
// Revision 1.00 - Version 1 of the Doppio Aggregator implemented. 
// Additional Comments: Currently at the most basic, first version.
// BIN_OUT[] is filled through the cores.dat binary file, generated through the binary_gen.py Python script.
// 
//////////////////////////////////////////////////////////////////////////////////
module aggregator(output logic [0:63] BIN_OUT [0:3]);
    
    always_comb begin 
        $readmemb("C:/Users/Arman/Desktop/DDCA/doppio_gui/scripts/cores.dat", BIN_OUT);
    end
        
endmodule
