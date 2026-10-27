module decoder3to8 (
    input logic en,
    input logic [2:0] sel,
    output logic [7:0] y
);

    logic en_lower;
    logic en_upper;

    assign en_lower = en & ~sel[2];
    assign en_upper = en & sel[2];

    decoder2to4 lower_decoder (
        .en(en_lower),
        .sel(sel[1:0]),
        .y(y[3:0])
    );

    decoder2to4 upper_decoder (
        .en(en_upper),
        .sel(sel[1:0]),
        .y(y[7:4])
    );

endmodule