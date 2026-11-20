`timescale 1ns/1ps

module tb;

    logic clk;
    logic rst_n;
    logic up_down;
    logic [3:0] count;
    logic [3:0] expected;
    integer errors = 0;

    // Connect the counter to the testbench
    up_down_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .count(count)
    );

    // Generate clock with 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Initial values
        rst_n = 1;
        up_down = 1;
        expected = 0;

        // Test 1: Initial asynchronous reset
        #2;
        rst_n = 0;
        #1;

        if (count !== expected) begin
            $display("[FAIL] Initial Reset");
            errors++;
        end
        else
            $display("[PASS] Initial Reset");

        // Release reset at falling clock edge
        @(negedge clk);
        rst_n = 1;

        // Test 2: Count up 5 times
        $display("--- Counting Up ---");

        repeat (5) begin
            

            @(posedge clk);
            #1;
            expected = expected + 1'b1;
            if (count !== expected) begin
                $display("[FAIL] Expected=%0d Actual=%0d",
                         expected, count);
                errors++;
            end
            else
                $display("[PASS] Expected=%0d Actual=%0d",
                         expected, count);
        end

        // Test 3: Asynchronous reset during counting
        $display("--- Mid-Count Reset ---");

        #2;
        rst_n = 0;
        expected = 0;
        #1;

        if (count !== expected) begin
            $display("[FAIL] Mid-Count Reset Expected=%0d Actual=%0d",
                         expected, count);
            errors++;
        end
        else
            $display("[PASS] Mid-Count Reset Expected=%0d Actual=%0d",
                         expected, count);

        // Release reset again
        @(negedge clk);
        rst_n = 1;

        // Test 4: Count up and check wraparound
        $display("--- Up Wraparound ---");

        repeat (16) begin
            up_down = 1;
            

            @(posedge clk);
            #1;
            expected = expected + 1'b1;
            if (count !== expected) begin
                $display("[FAIL] Expected=%0d Actual=%0d",
                         expected, count);
                errors++;
            end
            else
                $display("[PASS] Expected=%0d Actual=%0d",
                         expected, count);
        end

        // Test 5: Count down and check wraparound
        $display("--- Down Wraparound ---");

        repeat (16) begin
            up_down = 0;
            
            @(posedge clk);
            #1;
            expected = expected - 1'b1;
            if (count !== expected) begin
                $display("[FAIL] Expected=%0d Actual=%0d",
                         expected, count);
                errors++;
            end
            else
                $display("[PASS] Expected=%0d Actual=%0d",
                         expected, count);
        end

        // Final result
        if (errors == 0)
            $display("--- ALL TESTS PASSED ---");
        else
            $display("--- %0d TESTS FAILED ---", errors);

        $finish;

    end

endmodule
