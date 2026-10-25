module tb;
    logic [3:0] data;
    logic parity;
    integer i;
    logic expected;

    //instantiating the design
    parity_generator dut(
        .data(data), .parity(parity)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        for (i=0; i<16; i++) begin
            data = i;
            expected = $countones(data) % 2;
            #5
            if (parity !== expected) begin
                $display("[FAIL] data=%b expected=%b actual=%b", data, expected, parity);
            end
            else begin
                $display("[PASS] data =%b expected=%b actual=%b", data, expected, parity);
            end
        end
        $display("---Testing Complete---");
        $finish;
    end    
endmodule