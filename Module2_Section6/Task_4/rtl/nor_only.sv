//Implementation of given function
module nor_direct (
    input  logic a,
    b,
    c,
    d,
    output logic f
);
  assign f = (b | c | d) & (~a | b | c) & (~a | d);

endmodule

//Nor only implementation of given function
module nor_only (
    input  logic a,
    b,
    c,
    d,
    output logic f
);
  logic na, n1, n2, n3;
  assign na = ~(a | a);
  assign n1 = ~(b | c | d);
  assign n2 = ~(na | b | c);
  assign n3 = ~(na | d);
  assign f  = ~(n1 | n2 | n3);
endmodule
