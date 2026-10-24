module tb;
  logic a, b, c, d;
  logic f_direct, f_nor;
  integer i;
  logic f_expected;

  nor_direct dut1 (
      .a(a),
      .b(b),
      .c(c),
      .d(d),
      .f(f_direct)
  );

  nor_only dut2 (
      .a(a),
      .b(b),
      .c(c),
      .d(d),
      .f(f_nor)
  );
  initial begin
    // for viewing wave
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    for (i = 0; i < 16; i = i + 1) begin
      {a, b, c, d} = i[3:0];
      #5;

      if (f_direct !== f_nor)
        $display("[FAIL] a=%b b=%b c=%b d=%b f-direct=%b f-nor=%b", a, b, c, d, f_direct, f_nor);
      else $display("[PASS] a=%b b=%b c=%b d=%b f-direct=%b f-nor=%b", a, b, c, d, f_direct, f_nor);
    end

    $display("---- Testing complete ----");
    $finish;
  end

endmodule

