module mux2x1(
    input logic d0,d1,sel,
    output logic y
);
    always_comb begin
        case (sel)
            1'b0: y =d0;
            1'b1: y =d1;
            default: y = 1'b0;
        endcase
    end
endmodule

module majority_mux(
    input logic a,b,c,
    output logic f
);
logic x,z;

//a=0
mux2x1 mux1(
    .d0(1'b0),
    .d1(c),
    .sel(b),
    .y(x)
);

//a=1
mux2x1 mux2(
    .d0(c),
    .d1(1'b1),
    .sel(b),
    .y(z)
);
//select 1 mux
mux2x1 mux3(
    .d0(x),
    .d1(z),
    .sel(a),
    .y(f)
);    
endmodule