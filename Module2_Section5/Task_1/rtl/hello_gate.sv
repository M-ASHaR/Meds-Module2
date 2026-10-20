// ===== design.sv =====
module hello_gate (
input logic a, b,
output logic y_and, y_or, y_xor
);
always_comb begin
    y_and = a & b;
    y_or = a | b;
    y_xor = a ^ b;
end
endmodule