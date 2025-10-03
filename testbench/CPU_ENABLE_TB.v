`timescale 1ns/1ps
`define PATH "sim/CPU_ENABLE_TB_waveform.vcd"

module CPU_ENABLE_TB;
    reg [7:0] in;
    reg enable;
    wire [7:0] out;

    CPU_ENABLE uut(
        .in(in),
        .enable(enable),
        .out(out)
    );

    initial begin
        $dumpfile(`PATH);
        $dumpvars(0,CPU_ENABLE_TB);
    end

    initial begin
        in = 8'h0;
        enable = 0;
        #10;

        in = 8'hAA;
        #5 enable =1;
        #5 enable =0;
        #10;

        in = 8'h55;
        #5 enable = 1;
        #5 enable = 0;
        #10;

        in = 8'hFF;
        #5 enable = 1;
        #5 enable = 0;

        #10;
        $finish;
    end 

    initial begin
        //Monitor signals
        $monitor("At time %t: enable=%b in=%h out=%h", $time, enable, in, out);
    end
endmodule
