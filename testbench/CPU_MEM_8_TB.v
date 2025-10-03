`timescale 1ns/1ps
`define PATH "sim/CPU_MEM_8_TB_waveform.vcd"
module CPU_MEM_8_TB;
    reg [7:0] s;
    reg enable;
    wire [7:0] q;

    CPU_MEM_8 uut(
        .s(s),
        .enable(enable),
        .q(q)
    );

    initial begin
        $dumpfile(`PATH);
        $dumpvars(0,CPU_MEM_8_TB);
    end

    initial begin
        s = 0;
        enable = 0;
        #10;

        s = 8'hAA;
        #5 enable = 1;
        #5 enable = 0;

        #10;

        s = 8'h55;
        #5 enable = 1;
        #5 enable = 0;

        // Wait and check output
        #10;

        // Write 0xFF to memory
        s = 8'hFF;
        #5 enable = 1;
        #5 enable = 0;

        // Final wait and finish
        #10;
        $finish;

    end

    initial begin
        // Monitor signals
        $monitor("At time %t: enable=%b s=%h q=%h", $time, enable, s, q);
    end 
endmodule
