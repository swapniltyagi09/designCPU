`define PATH "sim/CPU_MEM_1_TB_waveform.vcd"
module CPU_MEM_1_TB;

    reg enable;
    reg s;
    wire q;

    // Instantiate the 1-bit memory cell
    CPU_MEM_1 uut (
        .enable(enable),
        .s(s),
        .q(q)
    );
    
    initial begin
        $dumpfile(`PATH);
        $dumpvars(0,CPU_MEM_1_TB);
    end 
    // Clock generation: 10 time units period
    initial begin
        enable = 0;
        forever #5 enable = ~enable;
    end

    // Test stimulus
    initial begin
        // Initialize input
        s = 0;
        
        // Wait for a few clock cycles
        #10;
        
        // Apply test values at each rising clock edge
        s = 1;
        #10;
        s = 0;
        #10;
        s = 1;
        #15; // Wait longer to see output stable
        
        // Finish simulation
        $finish;
    end

    // Optional: monitor signals
    initial begin
        $monitor("At time %t, enable = %b, s = %b, q = %b", $time, enable, s, q);
    end

endmodule

