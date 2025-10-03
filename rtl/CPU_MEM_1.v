module CPU_MEM_1(
    input wire s,
    input wire enable,
    output reg q);

   always@(posedge enable) begin 
        q <= s;
    end 
endmodule
