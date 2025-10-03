module CPU_ENABLE(
    input wire [7:0] in,
    input wire enable,
    output wire [7:0] out
    );

    assign out = enable ? in : out;

endmodule
