`timescale 1ns / 1ps

module andxor ();
    
    reg[15:0] X = 16'b0101010101010100;
    reg[15:0] Y = 16'b1111111111111111;
    reg[7:0] SUMBIT = 16'b0000000000000000;
    reg[7:0] r = 8'b0;
    reg[7:0] in = 8'b00000011;
    
    wire[15:0] AND,XOR;
    
    integer i;
    assign AND = X & Y;
    
    
    initial
        begin
         //Scalar Tests 
         $display("AND of X and Y is %b", AND);
        
        
         for(i=0;i<16;i = i+1)begin
             $display(" AND of each bit in X and Y is %b", AND[i] );
             SUMBIT = SUMBIT + AND[i];
         end
         $display("SUMING together the AND bits will give us %b", SUMBIT);
         
         
         r = in ^ SUMBIT;
         
         $display("XORING each sumbit will produce a  output of... %b", r);
         
         
         
         #100 $finish ;
        
          
        end
  endmodule
    
    
