module shifter4 (
    input logic [3:0] w,
    input logic shift,
    output logic [3:0] y,
    output logic k
);
    assign y[3] = shift ? 1'b0:w[3];
    assign y[2] = shift ? w[3]:w[2];
    assign y[1] = shift ? w[2]:w[1];
    assign y[0] = shift ? w[1]:w[0];

    assign k = shift ? w[0]:1'b0; 
endmodule