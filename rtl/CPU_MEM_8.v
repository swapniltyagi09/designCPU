module CPU_MEM_8 (
    input wire [7:0] s,
    input wire enable,
    output wire [7:0] q
    );

    genvar i;
    generate
        for(i = 0 ; i < 8; i = i+1) begin : MEM_BITS
            CPU_MEM_1 mem_inst(
                .s(s[i]),
                .enable(enable),
                .q(q[i])
            );

        end 
    endgenerate 
endmodule
