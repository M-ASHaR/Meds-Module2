module barrel_shifter(
    input logic [3:0] w,
    input logic [1:0] sel,
    output logic [3:0] y
);
    always_comb begin 
        unique case (sel)
            2'b00: y=w; 
            2'b01: y={w[0], w[3:1]};
            2'b10: y={w[1:0], w[3:2]};
            2'b11: y={w[2:0], w[3]};
        endcase
    end
endmodule