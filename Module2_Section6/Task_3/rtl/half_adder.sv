// Half adder using continuous assign
module half_adder_assign(
    input logic a, b,
    output logic sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule


// Half adder using always_comb and if-else
module half_adder_comb(
    input logic a, b,
    output logic sum, carry
);
    always_comb begin
        // Calculate sum (XOR)
        if (a == b)
            sum = 1'b0;
        else
            sum = 1'b1;

        // Calculate carry (AND)
        if ((a == 1'b1) && (b == 1'b1))
            carry = 1'b1;
        else
            carry = 1'b0;
    end
endmodule