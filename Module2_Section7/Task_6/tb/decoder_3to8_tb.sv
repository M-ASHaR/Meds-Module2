module tb;
    logic en;
    logic [2:0] sel;
    logic [7:0] y;

    logic [7:0] expected;
    integer i;

    decoder3to8 dut (
        .en(en),
        .sel(sel),
        .y(y)
    );
    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        en = 1'b1;
        for (i = 0; i < 8; i = i + 1) begin
            sel = i;
            expected = 8'b00000001 << i;
            #5;

            if (y !== expected) begin
                $display("[FAIL] en=%b sel=%b expected=%b actual=%b",en, sel, expected, y);
            end
            else begin
                $display("[PASS] en=%b sel=%b expected=%b actual=%b",en, sel, expected, y);
            end

        end

        // Test all select combinations when disabled
        en = 1'b0;

        for (i = 0; i < 8; i = i + 1) begin

            sel = i;
            expected = 8'b00000000;

            #5;

            if (y !== expected) begin
                $display(
                    "[FAIL] en=%b sel=%b expected=%b actual=%b",
                    en, sel, expected, y
                );
            end
            else begin
                $display(
                    "[PASS] en=%b sel=%b expected=%b actual=%b",
                    en, sel, expected, y
                );
            end

        end

        $display("--- Testing Complete ---");

        $finish;

    end

endmodule