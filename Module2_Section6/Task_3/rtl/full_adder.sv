//full adder using assign
module full_adder_assign(
    input logic a, b, c_in,
    output logic sum, carry

);
    logic sum_h1, carry_h1, carry_h2;
    // First half adder: adds a and b
    assign sum_h1 = a ^ b;
    assign carry_h1 = a & b;
    // Second half adder: adds sum_h1 and c_in
    assign sum = sum_h1 ^ c_in;
    assign carry_h2 = sum_h1 & c_in;
    // combining two carry signals to get carry for full adder
    assign carry = carry_h1 | carry_h2;
endmodule

//full adder using always_comb and if-else
module full_adder_comb(
    input logic a, b, c_in,
    output logic sum, carry
);
      logic sum_h1, carry_h1, carry_h2;

always_comb begin
    //First half adder
    if (a==b) 
        sum_h1 = 1'b0;
    else
        sum_h1 = 1'b1;
    if ((a==1'b1) && (b==1'b1)) 
        carry_h1 =1'b1; 
    else
        carry_h1 = 1'b0;
    //second half adder
    if (sum_h1==c_in)
        sum = 1'b0;
    else
        sum = 1'b1;
    if ((sum_h1==1'b1) && (c_in==1'b1))
        carry_h2=1'b1;
    else
        carry_h2=1'b0;
    //Combining both carries through OR Gate
    if ((carry_h1 == 1'b1) || (carry_h2 == 1'b1))
        carry = 1'b1;
    else
        carry = 1'b0;    
end
endmodule