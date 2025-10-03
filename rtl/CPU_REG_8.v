module CPU_REG_8(
    input wire [7:0] in,
    input wire set,
    input wire enable,
    output wire [7:0] out);

    wire [7:0] memOut;
    
    CPU_MEM_8 cpuMem8(.s(in),.enable(set),.q(memOut));
    CPU_ENABLE cpuEnable(.in(memOut),.enable(enable),.out(out));

endmodule
