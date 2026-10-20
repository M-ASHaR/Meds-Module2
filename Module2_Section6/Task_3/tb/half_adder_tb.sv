module tb;

logic a, b;
logic sum_assign, carry_assign;
logic sum_comb, carry_comb;

//instantiating the assign half adder 
half_adder_assign ha1 (
    .a(a), 
    .b(b),
    .sum(sum_assign), 
    .carry(carry_assign)
);
//instantiating the always_comb half adder 
half_adder_comb ha2(
    .a(a), 
    .b(b),
    .sum(sum_comb), 
    .carry(carry_comb)
);

task check_half_adder;
    logic expected_sum, expected_carry;
    begin
        expected_sum   = a ^ b;
        expected_carry = a & b;
        //checking the implementation of half adder
        if ({sum_assign, carry_assign} !== {expected_sum, expected_carry})
            $display("[FAIL] Half Adder incorrect: a=%b b=%b", a, b);
        else
            $display("[PASS] Half Adder correct: a=%b b=%b", a, b);
        //checking the correctness of our argument
        if ({sum_assign, carry_assign} !== {sum_comb, carry_comb})
            $display("[FAIL] Half Adder differ: a=%b b=%b", a, b);
        else
            $display("[PASS] Half Adder match: a=%b b=%b", a, b);
    end
endtask

initial begin
// for viewing wave
$dumpfile("dump.vcd");
$dumpvars(0, tb);


    a = 0; b = 0; #10;
    check_half_adder();
    a = 0; b = 1; #10;
    check_half_adder();
    a = 1; b = 0; #10;
    check_half_adder();
    a = 1; b = 1; #10;
    check_half_adder();

    $finish;
end
endmodule