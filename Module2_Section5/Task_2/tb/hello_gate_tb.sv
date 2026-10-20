module tb;
logic a, b; 
logic y_and, y_or, y_xor;
hello_gate dut (
    .a(a), 
    .b(b), 
    .y_and(y_and), 
    .y_or(y_or), 
    .y_xor(y_xor));

task automatic check(
    input logic actual, 
    input logic expected, 
    input logic name);
    if (actual !== expected)
        $display("[FAIL] %s: expected=%0b actual=%0b at time=%0t", name, expected, actual, $time);
    else
        $display("[PASS] %s: value=%0b at time=%0t", name, actual, $time);
endtask

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    //Test 1 a=0, b=0
    a=0; b=0; #10
    check(y_and, 1'b0, "AND (00)");
    check(y_or, 1'b0, "OR (00)");
    check(y_xor, 1'b0, "XOR(00)");

    //Test 2 a=0, b=1
    a=0; b=1; #10
    check(y_and, 1'b0, "AND (01)");
    check(y_or, 1'b1, "OR (01)");
    check(y_xor, 1'b1, "XOR(01)");

    //Test 3 a=1, b=0
    a=1; b=0; #10
    check(y_and, 1'b0, "AND (10)");
    check(y_or, 1'b1, "OR (10)");
    check(y_xor, 1'b1, "XOR(10)");

    //Test 4 a=1, b=1
    a=1; b=1; #10
    check(y_and, 1'b1, "AND (11)");
    check(y_or, 1'b1, "OR (11)");
    check(y_xor, 1'b0, "XOR(11)");
$finish;
end
endmodule 