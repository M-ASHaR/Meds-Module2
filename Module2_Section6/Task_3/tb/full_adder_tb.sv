module tb;

logic a, b, c_in;
logic sum_assign, carry_assign;
logic sum_comb, carry_comb;
integer i;
//instantiating the assign full adder
full_adder_assign fa1 (
    .a(a), 
    .b(b),
    .c_in(c_in),
    .sum(sum_assign), 
    .carry(carry_assign)
);
//instantiating the always_comb full adder
full_adder_comb fa2(
    .a(a), 
    .b(b),
    .c_in(c_in),
    .sum(sum_comb), 
    .carry(carry_comb)
);

task check_full_adder;
    logic expected_sum, expected_carry;
    begin
        expected_sum   = a ^ b ^ c_in;
        expected_carry = (a & b) | ((a ^ b) & c_in);
        //checking the implementation of half adder
        if ({sum_assign, carry_assign} !== {expected_sum, expected_carry})
            $display("[FAIL] Full Adder incorrect: a=%b b=%b c_in=%b", a, b, c_in);
        else
            $display("[PASS] Full Adder correct: a=%b b=%b c_in=%b", a, b, c_in);
        //checking the correctness of our argument
        if ({sum_assign, carry_assign} !== {sum_comb, carry_comb})
            $display("[FAIL] Full Adder differ: a=%b b=%b c_in=%b", a, b, c_in);
        else
            $display("[PASS] Full Adder match: a=%b b=%b c_in=%b", a, b, c_in);
    end
endtask

initial begin
// for viewing wave
$dumpfile("dump.vcd");
$dumpvars(0, tb);

    for (i = 0; i < 8; i = i + 1) begin
        {a, b, c_in} = i[2:0];
        #5;
        check_full_adder();
    end
    $display("----Testing complete----");
    $display("Adder correct means the implementation is correct");
    $display("Adder match means the assign and always_comb result is same.");
    $finish;
end
endmodule