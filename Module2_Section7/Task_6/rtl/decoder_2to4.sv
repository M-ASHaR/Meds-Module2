module decoder2to4 (
    input logic en,
    input logic [1:0] sel,
    output logic [3:0] y
);
    always_comb begin
        if (!en) begin
            y=4'b0000;
        end
        else begin
            case (sel)
                2'b00: y = 4'b0001;
                2'b01: y = 4'b0010;
                2'b10: y = 4'b0100;
                2'b11: y = 4'b1000;
                default: y = 4'b0000;
            endcase
        end
    end
endmodule