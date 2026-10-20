module tb;
logic a, b, y_and, y_or, y_xor;
hello_gate dut (.a(a), .b(b), .y_and(y_and), .y_or(y_or), .y_xor(y_xor));

initial begin

$dumpfile("dump.vcd");
$dumpvars(0, tb);

a = 0; b = 0; #10;
$display("a=%0b b=%0b and=%0b or=%0b xor=%0b", a, b, y_and, y_or, y_xor);

a = 0; b = 1; #10;
$display("a=%0b b=%0b and=%0b or=%0b xor=%0b", a, b, y_and, y_or, y_xor); 

a = 1; b = 0; #10;
$display("a=%0b b=%0b and=%0b or=%0b xor=%0b", a, b, y_and, y_or, y_xor);

a = 1; b = 1; #10;
$display("a=%0b b=%0b and=%0b or=%0b xor=%0b", a, b, y_and, y_or, y_xor);

$finish;
end
endmodule 