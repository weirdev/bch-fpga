`timescale 1ns / 1ps

module andxorBENCH();

//parameter HalfClk = 10;


// test inputs
logic [15:0] X, Y;
logic[7:0]  R,IN;
logic CLK,ARESET; //used in future implementation
logic [7:0] ORING;
logic InputValid;  //used in future implementation for interconnect 
integer i, j, k;
logic [15:0] SUMBIT;


// test outputs
// used in future implementation for interconnect 
wire InputReady;



andxor dut(
    .X(X),
    .Y(Y),
    .SUMBIT(SUMBIT),
    .R(R),
    .ORING(ORING)
    );
    
    initial begin
            // exhaustively test the circuit
            
             X = 16'b0001000100110001;
             Y = 16'b0001000100010001;
             IN = 8'b00000101;
             R = 8'b10;
             #1; // delay 1 ns
             assert(SUMBIT == (X&Y)) else $error("Failed %d & %d | %d != %d", X, Y, IN, SUMBIT);
             $display("SUMBIT IS %b" , SUMBIT);
             
             $display("Oring is %b", ORING);
         

         
               end
          
    endmodule
