`timescale 1ns / 1ps

module andxor_test();

parameter HalfClk = 10;

// test inputs
logic [31:0] ReadData;
logic [15:0] IVLength, CWLength;
logic CLK, areset, InputValid;
logic [31:0] ReadAddr;

// test outputs
wire inputReady, dataOutWrite;
wire [31:0] DataOut;

andxor dut(
    .ReadData(ReadData),
    .CLK(CLK),
    .areset(areset),
    .IVCWLength({IVLength, CWLength}),
    .AddressOut(ReadAddr),
    .DataOut(DataOut),
    .DataOutWrite(dataOutWrite),
    .InputValid(InputValid),
    .InputReady(inputReady)
    );
    
    always
     #(HalfClk) CLK = ~CLK; 
     
    `define waitForReady \
        $display("Waiting for InputReady"); \
         while(inputReady != 1'b1) begin \
                         #(HalfClk * 2); \
         end
    
    `define waitForOutValid \
                    $display("Waiting for first point"); \
        while ( dataOutWrite == 1'b0 ) begin \
                #(HalfClk * 2); \
        end
    
    `define displayOut \
           while ( dataOutWrite == 1'b1 ) begin \
                //assuming we are able to plot to the same point, coords must be positive, and meet WIDTH requirements \
                assert(Sum == 1) \
                    else $error( "error"); \
                #(HalfClk * 2); \
            end
    
    // NOTE: this testbench doesn't include assertions
    // you need to add them (recommended to put them in the define macros above)
    initial begin
        CLK = 1'b0;
        InputValid = 1'b0;
        // reset
        areset = 1'b0;
        #(HalfClk * 5);
        // reset finished
        areset = 1'b1;
        #(HalfClk *3);
        
        // engine should start in ready state
        if (inputReady != 1'b1) $fatal("not ready");
        
        // basic test case
        $display("Dot prod to 1");
        IVLength = 1;
        CWLength = 1;
        ReadData = 8'b01101101;
        InputValid = 1'b0;
       
        #(HalfClk * 2);
        // wait until InputReady
        `waitForReady
        InputValid = 1'b1;
        #(HalfClk * 2 * 3);
        ReadData = 8'b01101000;
        
        // wait until we see DataOutWrite go to 1
        `waitForOutValid
        #(HalfClk * 2);
        // display each point that is plotted
        $timeformat(-9, 2, " ns", 20);
        //assuming we are able to plot to the same point, coords must be positive, and meet WIDTH requirements \
        if (DataOut == 1) $display("good");
            else $error( "error");
        #(HalfClk * 2);
        
        /*
        
        // test case where the line is steep
        $display("plot steep (1,1) to (5,11)");
        x0in = 1;
        y0in = 1;
        x1in = 5;
        y1in = 11;
        colorIn = 24'h00ffffff;
        InputValid = 1'b1;
         #(HalfClk * 2);
         `waitForReady
         #(HalfClk * 2);
         InputValid = 1'b0;
         `waitForOutValid
         `displayOut
        
        */                                         
    end
    
    
endmodule
