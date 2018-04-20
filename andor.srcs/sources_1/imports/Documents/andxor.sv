`timescale 1ns / 1ps

module andxor (
    
    input[15:0] X,
    input[15:0] Y,
    output [7:0] SUMBIT,   
    input[7:0] R,
    output[7:0] ORING,
    input CLK, 
    input ARESET,
    input InputValid,
    output InputReady
    );
    
   
    assign SUMBIT = (X & Y);
    assign ORING = ( SUMBIT ^  R);
    
    
    //possible next implemenatation 
    
    /*
    logic [1:0] state;
    logic [1:0] nextState;
    */
    
    /*
    
   always_ff@(posedge CLK) begin
                if (ARESET == 1'b0) begin
                   state <= 2'b00;
               end else begin
                   state <= nextState;
                end
           end
   */

    
    
    // Next state logic
    /*    always_comb begin
            case(state)
                2'b00 : 
                    if (InputValid == 1'b1) nextState = 2'b01;
                    else nextState = 2'b00;
                2'b01 : nextState = 2'b10;
                2'b10 : 
                    if (finish) nextState = 2'b00;
                    else nextState = 2'b10; 
            endcase
        end
     */   
    endmodule
    
    
    
    
  

    
    
