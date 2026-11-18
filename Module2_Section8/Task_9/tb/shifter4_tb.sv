module tb;
    logic [3:0] w;
    logic shift;
    logic [3:0] y;
    logic k;

    logic [3:0] expected_y;
    logic expected_k;
    integer i,s;

    shifter4 dut(
        .w(w), .shift(shift), .y(y), .k(k)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);

        for (i=0;i<16;i++) begin
            w=i[3:0];

            for (s=0; s<2; s++) begin
                //Value of s that can be 0 or 1 i assigned to shift
                shift=s;
                //if shift is 1 than shift right by 1
                expected_y= shift ? (w>>1):w;
                //if shift is 1 than LSB of W is equal to k
                expected_k= shift ? w[0]:1'b0;

                #10;
                if ((y!==expected_y) || (k!==expected_k)) begin
                    $display("[FAIL] W=%b shift=%b Expected_Y =%b Actual_Y=%b Expected_K=%b Actual_K=%b", w, shift, expected_y, y, expected_k, k);
                end

                else begin
                    $display("[PASS] W=%b shift=%b Expected_Y =%b Actual_Y=%b Expected_K=%b Actual_K=%b", w, shift, expected_y, y, expected_k, k);
                end

            end
        end

        $display("---Testing Complete---");
        $finish;
    end
endmodule