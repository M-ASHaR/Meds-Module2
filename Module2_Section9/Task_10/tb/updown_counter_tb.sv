
`timescale 1ns/1ps

module tb;

    logic clk, rst_n, up_down;
    logic [3:0] count;
    logic [3:0] expected;
    integer errors = 0;

    up_down_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .count(count)
    );

    // Clock: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Check one counting operation
    task automatic check_count(input logic direction);
        up_down = direction;

        if (direction)
            expected = expected + 1'b1;
        else
            expected = expected - 1'b1;

        @(posedge clk);
        #1;

        if (count !== expected) begin
            $display("[FAIL] up_down=%b expected=%d actual=%d",
                     direction, expected, count);
            errors++;
        end
        else begin
            $display("[PASS] up_down=%b expected=%d actual=%d",
                     direction, expected, count);
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        rst_n = 1;
        up_down = 1;
        expected = 0;

        // Initial asynchronous reset
        #2;
        rst_n = 0;
        #1;

        if (count !== 0) begin
            $display("[FAIL] Initial reset");
            errors++;
        end
        else
            $display("[PASS] Initial reset");

        @(negedge clk);
        rst_n = 1;

        // Count up for 5 clock cycles
        $display("--- Counting Up ---");
        repeat (5)
            check_count(1'b1);

        // Reset between clock edges
        #2;
        rst_n = 0;
        expected = 0;
        #1;

        if (count !== 0) begin
            $display("[FAIL] Asynchronous reset");
            errors++;
        end
        else
            $display("[PASS] Asynchronous reset");

        @(negedge clk);
        rst_n = 1;

        // Count up, including 15 -> 0
        $display("--- Up Count and Wraparound ---");
        repeat (16)
            check_count(1'b1);

        // Count down, including 0 -> 15
        $display("--- Down Count and Wraparound ---");
        repeat (16)
            check_count(1'b0);

        if (errors == 0)
            $display("--- ALL TESTS PASSED ---");
        else
            $display("--- %0d TESTS FAILED ---", errors);

        $finish;
    end

endmodule
