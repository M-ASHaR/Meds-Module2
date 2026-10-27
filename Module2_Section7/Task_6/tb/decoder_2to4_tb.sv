module tb;
    logic en;
    logic [1:0] sel;
    logic [3:0] y;

    logic [3:0] expected;
    integer i;

    decoder2to4 dut (
        .en(en),
        .sel(sel),
        .y(y)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        //checking when enabled
        en = 1'b1;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            expected = 4'b0001 << i;
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

        //checking when decoder is disabled
        en = 1'b0;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            expected = 4'b0000;
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