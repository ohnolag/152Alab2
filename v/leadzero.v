module leadzero (
    input  [11:0] postabs_D,
    output reg [2:0] ir_E,
    output reg [3:0] ir_F,
    output reg       round_bit
);

    integer i;
    reg found_msb;
    reg [3:0] msb_idx;
    reg [3:0] shift_amt;
    reg [11:0] shifted_val;

    always @(*) begin
        ir_E = 3'd0;
        ir_F = 4'd0;
        round_bit = 1'b0;
        msb_idx = 4'd0;
        shift_amt = 4'd0;
        shifted_val = 12'd0;
        found_msb = 1'b0;

        if (postabs_D != 12'd0) begin
            for (i = 11; i >= 0; i = i - 1) begin
                if (!found_msb && postabs_D[i]) begin
                    msb_idx = i[3:0];
                    found_msb = 1'b1;
                end
            end

            // The absolute value of -2048 is 2048, which needs an effective
            // shift of 8 and cannot be encoded by the 3-bit exponent.
            if (msb_idx == 4'd11) begin
                ir_E = 3'b111;
                ir_F = 4'b1111;
                round_bit = 1'b1;
            end else begin
                if (msb_idx > 4'd3) begin
                    shift_amt = msb_idx - 4'd3;
                end

                ir_E = shift_amt[2:0];
                shifted_val = postabs_D >> shift_amt;
                ir_F = shifted_val[3:0];

                if (shift_amt != 4'd0) begin
                    round_bit = postabs_D[shift_amt - 1'b1];
                end
            end
        end
    end

endmodule
