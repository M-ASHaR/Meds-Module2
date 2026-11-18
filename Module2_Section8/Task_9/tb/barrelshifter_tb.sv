module tb;
    logic [3:0] w;
    logic [1:0] sel;
    logic [3:0] y;
    logic [3:0] expected_y;
    integer i, s;

    barrel_shifter dut(
        .w(w), .sel(sel), .y(y)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);
        //checking outputs for values from 10(4'b1010) to 14(4'b1110)
        for (i = 10; i < 15; i++) begin
            w = i[3:0];

            // Test all 4 rotation selections
            for (s = 0; s < 4; s++) begin
                sel = s[1:0];

                // Independent reference model:
                // Rotate w right by sel positions
                expected_y = (w >> sel) | (w << (4 - sel));

                #10;

                if (y !== expected_y) begin
                    $display("[FAIL] w=%b sel=%d expected=%b actual=%b",
                             w, sel, expected_y, y);
                end
                else begin
                    $display("[PASS] w=%b sel=%d expected=%b actual=%b",
                             w, sel, expected_y, y);
                end
            end
        end

        $display("---Testing Complete---");
        $finish;
    
    end
endmodule