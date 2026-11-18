module mux4x1 (
    input logic d0, d1, d2, d3,
    input logic [1:0] sel,
    output logic y
);
always_comb begin 
    
    case(sel)
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        2'b11: y = d3;
        default: y = 1'b0;
    endcase

end   
endmodule


module task8_mux (
    input logic a, b, c,
    output logic y
);
    mux4x1 u_mux (
        .sel({a, b}), // concatenation: sel[1]=a, sel[0]=b
        .d0(c), .d1(1'b1), .d2(1'b0), .d3(1'b1),
        .y(y)
);
endmodule