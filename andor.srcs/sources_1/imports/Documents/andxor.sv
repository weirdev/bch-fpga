`timescale 1ns / 1ps

module andxor ();

    reg[15:0] X = 16'b0101010101010100;
    reg[15:0] Y = 16'b1111111111111111;
    reg[7:0] SUMBIT = 16'b0000000000000000;
    reg[0:0] in = 1'b1;
    reg[0:0] a = 1'b0;
    reg[0:0] b = 1'b0;
    reg[0:0] c = 1'b0;
    reg[0:0] d = 1'b0;
    reg[0:0] e = 1'b0;
    reg[0:0] f = 1'b0;
    reg[0:0] g = 1'b0;
    reg[0:0] h = 1'b0;
    reg[0:0] ii = 1'b0;
    reg[0:0] j = 1'b0;
    reg[0:0] k = 1'b0;
    reg[0:0] l = 1'b0;
    reg[0:0] m = 1'b0;
    reg[0:0] n = 1'b0;
    wire[15:0] AND,XOR;
    
    integer i;
    assign AND = X & Y;
    
    
    
    initial
        begin
         #10;
         //Scalar Tests 
         $display("AND of X and Y is %b", AND);
         
         for(i=0;i<15;i = i+1)begin
             $display(" AND of each bit in X and Y is %b", AND[i] );
             SUMBIT = SUMBIT + AND[i];
         end
         $display("SUMING together the AND bits will give us %b", SUMBIT);
         
         a = in ^ SUMBIT[0];
         b = a ^ SUMBIT[1];
         c = b ^ SUMBIT[2];
         d = c ^ SUMBIT[3];
         e = d ^ SUMBIT[4];
         f = e ^ SUMBIT[5];
         g = f ^ SUMBIT[6];
         h = g ^ SUMBIT[7];
         $display("XORING each sumbit will produce a single bit output of... %b", h);
         
         
        
         
             
         
         
         
        
        end
     endmodule
    
    
