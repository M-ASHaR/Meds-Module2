module tb;
    logic a,b,c;
    logic f;
    logic [2:0] abc;
    logic expected;
    integer i;
majority_mux dut(
    .a(a), .b(b), .c(c), .f(f)
);    
initial begin
    $dumpfile("majority.vcd");
    $dumpvars(0, tb);

    for(i=0;i<8;i++) begin
        abc = i[2:0];
        {a,b,c}= abc;

        //Majority is 1 when atleast two inputs are one.
        expected= (a & b | a & c | b & c);
        #10;
        if (f!==expected) begin
            $display("[FAIL] abc=%b expected=%b Actual=%b", abc, expected, f);
        end

        else begin
            $display("[PASS] abc=%b expected=%b Actual=%b", abc, expected, f);
        end
    end

    $display("----Testing Complete----");
    $finish; 
end
endmodule