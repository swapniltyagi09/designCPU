`timescale 1ns/1ps
`define PATH "sim/CPU_REG_8_TB_waveform.vcd"

module CPU_REG_8_TB;
    reg [7:0] in;
    reg set;
    reg enable;
    wire [7:0] out;

    initial begin
        $dumpfile(`PATH);
        $dumpvars(0,CPU_REG_8_TB);
    end 

    CPU_REG_8 uut(
        .in(in),
        .set(set),
        .enable(enable),
        .out(out)
    );

    initial begin
        in = 8'h0;
        set = 0;
        enable = 0;
        #10;

        in = 8'hAA;
        set = 1;
        enable = 0;
        #10;

        set = 0;
        #10;

        enable = 1;
        #10;

        in = 8'h55;
        set = 1;
        #10;

        set = 0;
        #10;

        enable = 0;
        #10;

        in = 8'h34;
        #10 set = 1;
        #10 enable = 0;

        $finish;
    end 

    initial begin
        $monitor("At time %t: set = %b enable = %b in = %h out = %h",$time,set,enable,in,out);
    end 
endmodule
