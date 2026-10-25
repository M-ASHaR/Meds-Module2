module parity_generator (
    input logic [3:0] data,
    output logic parity
);
 //XOR produces 1 when its inputs contain an odd number of 1s.Therefore, reduction XOR gives exactly the parity required
    assign parity = ^data;
endmodule