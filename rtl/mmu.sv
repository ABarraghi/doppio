`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Juniata College
// Engineer: Arman Barraghi Zadeh
// 
// Create Date: 04/06/2025 05:24:26 PM
// Design Name: Doppio Memory Management Unit 
// Module Name: mmu
// Project Name: doppio_gui
// Target Devices: Artix A7 FPGA
// Tool Versions: N/A
// Description: Basic Version of the Doppio MMU,
// Takes in as input: 
// * N number of processor data streams, IN[N]. For the current case, N = 4, with IN[i] being 32 bits large.
// * Explicit toggle off determinism flag, D_OFF.
// Output created: 64 bit output selected from the IN[] in a deterministic fashion, OUT.
// 
// Dependencies: 
// 
// Revision:
// Revision 1.00 - Version 1 of the Doppio MMU implemented. 
// Additional Comments: Currently at the most basic, first version.
// 
//////////////////////////////////////////////////////////////////////////////////

    //MMU takes in as input N number of 64 bit processor input streams, from the aggregator
    //And a D_OFF flag
    //And makes as output a selected input stream
module mmu(input D_CLK,
           input D_OFF,
           output logic [0:63] OUT,
           output logic LED_0,
           output logic LED_1,
           output logic LED_2
           ); 
           

    //Define IN from aggregator module
    logic [0:63] IN [0:3];
    aggregator agg(.BIN_OUT (IN) );
    
    int count = 0;
    
    localparam [2:0] //Defining states 
        ZERO = 3'd0,
        ONE = 3'd1,
        TWO = 3'd2,
        THREE = 3'd3,
        RND = 3'd4;
        
     
     logic [2:0] state = ZERO;
     
     logic [3:0] lfsr = 4'b1101;  // Non-zero seed value
     int RND_IDX, CUR_IDX = 0;
     
     //Implementing the FSM as HDL
     //Set output logic based on D_OFF
     always @ (posedge D_CLK) begin
        // Update LFSR on every clock
        lfsr<= {lfsr[2:0] , lfsr[3] ^ lfsr[2]};  // XOR feedback
        
        // Use middle 2 bits for random number
        RND_IDX <= lfsr[2:1];
     
        case (state)
        
            ZERO: begin
            
                LED_0 <= 0;
                LED_1 <= 0;
                LED_2 <= 0;
            
                OUT <= IN[0];
                
                if (count < 10000000) begin
                
                    state <= ZERO;
                    count <= count + 1;
                
                end
                
                else begin
                
                    count <= 0;
                    if (D_OFF) state <= RND;
                    else state <= ONE;
                    
                end
            end
            
            ONE: begin
            
                LED_0 <= 1;
                LED_1 <= 0;
                LED_2 <= 0;
            
                OUT <= IN[1];
                
                if (count < 10000000) begin
                
                    state <= ONE; 
                    count <= count + 1;
                
                end
                
                else begin
                
                    count <= 0;
                    if (D_OFF) state <= RND;
                    else state <= TWO;
                
                end
                
            end
            
            TWO: begin
            
                LED_0 <= 1;
                LED_1 <= 1;
                LED_2 <= 0;
            
                OUT <= IN[2];
                
                if (count < 10000000) begin
                
                    state <= TWO;
                    count <= count + 1;
                
                end 
                
                else begin
                
                    count <= 0;
                    if (D_OFF) state <= RND;
                    else state <= THREE;
                
                end
                
            end
            
            THREE: begin
            
                LED_0 <= 1;
                LED_1 <= 1;
                LED_2 <= 1;
             
                OUT <= IN[3];
                
                if (count < 10000000) begin
                
                    state <= THREE;
                    count <= count + 1;
                
                end
                
                else begin
                
                    count <= 0;
                    if (D_OFF) state <= RND;
                    else state <= ZERO;
                    
                end
            end
            
            RND: begin 
                
                if (count == 0) CUR_IDX <= RND_IDX;
            
                case (CUR_IDX) 
                
                    0: begin
                    
                        LED_0 <= 0;
                        LED_1 <= 0;
                        LED_2 <= 0;
                    
                    end
                    
                    1: begin
                    
                        LED_0 <= 1;
                        LED_1 <= 0;
                        LED_2 <= 0;
                    
                    end
                    
                    2: begin
                    
                        LED_0 <= 1;
                        LED_1 <= 1;
                        LED_2 <= 0;
                    
                    end
                    
                    3: begin
                    
                        LED_0 <= 1;
                        LED_1 <= 1;
                        LED_2 <= 1;
                    
                    end
                
                endcase
                
                
                OUT <= IN[CUR_IDX];
                
                if (count < 10000000) begin
                
                    state <= RND;
                    count <= count + 1;
                
                end 
                
                else begin
                
                    count <= 0;
                    CUR_IDX <= 0;
                    if (D_OFF) state <= RND;
                    else state <= ZERO;
                
                end
            
            end
            
        endcase
            
     end
    
endmodule
