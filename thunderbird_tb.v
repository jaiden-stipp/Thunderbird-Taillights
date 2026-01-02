module thunderbird_tb;

    
    reg left, right, hazard, clk;
    wire Lc, Lb, La, Ra, Rb, Rc; 

    localparam CLK_PERIOD = 10; 

    
    thunderbird DUT (
        .left(left), .right(right), .hazard(hazard), .clk(clk),
        .Lc(Lc), .Lb(Lb), .La(La), .Ra(Ra), .Rb(Rb), .Rc(Rc)
    );

    // Clock Generation
    initial begin
        clk = 1'b0; 
        forever #(CLK_PERIOD / 2) clk = ~clk; 
    end

   
    initial begin
        // Initial setup 
        left = 1'b0;
        right = 1'b0;
        hazard = 1'b0;
        
       
        repeat(2) @(posedge clk);
        
        // Pressing Right
        right = 1'b1;
        
        
        repeat(5)@(posedge clk);
        
        // Reset
        left = 1'b0;
        right = 1'b0;
        @(posedge clk);
        @(posedge clk);
        
        
        // Pressing Left
        left = 1'b1;
        
        repeat(7)@(posedge clk); 
        
       
        
       
        
        // Hazard Test
        
        left = 1'b0;
        right = 1'b0;
        hazard = 1'b1;
        
        repeat(5)@(posedge clk); 
	// Reset
        hazard = 1'b0;
        left = 1'b0;
        right = 1'b0;
        
        repeat(2)@(posedge clk); 


        $finish;
    end
    
endmodule