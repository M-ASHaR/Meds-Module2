module tb;
    logic a,b,c;    
    logic y;
    logic [2:0] abc;
    logic expected;
    integer i;

task8_mux dut(
    .a(a), .b(b), .c(c), .y(y)
);
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    for (i = 0; i < 8; i = i + 1) begin
        abc=i[2:0];
        {a, b, c} = abc;
        // Expected output 
        expected = (i == 1 || i == 2 || i == 3 || i == 6 || i == 7);
        #10;
        if (y !== expected) begin
                $display("[FAIL] Minterm = %0d      abc = %b    expected = %b    Actual = %b",i, abc, expected, y);
            end
            else begin
                $display("[PASS] Minterm = %0d      abc = %b    y = %b",i, abc, y);
            end
    end

    $display("----Testing Complete!---");

        $finish;
end

endmodule