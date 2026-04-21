module leadzero (
    input  [11:0] postabs_D,
    output reg [3:0] ir_E,
    output reg [4:0] ir_F
);

    integer i;
    reg found_msb;
    reg [3:0] msb_idx;
    reg [11:0] shifted_val;
    reg guard_bit;

    always @(*) begin
        ir_E = 4'd0;
        ir_F = 5'd0;
        msb_idx = 4'd0;
        shifted_val = 12'd0;
        found_msb = 1'b0;
        guard_bit = 1'b0;

        if (postabs_D != 12'd0) begin
            for (i = 11; i >= 0; i = i - 1) begin
                if (!found_msb && postabs_D[i]) begin
                    msb_idx = i[3:0];
                    found_msb = 1'b1;
                end
            end

            // E is the encoded count of leading zeros. For the 12-to-8
            // format this is equivalent to max(msb_index - 3, 0).
            if (msb_idx > 4'd3) begin
                ir_E = msb_idx - 4'd3;
            end

            shifted_val = postabs_D >> ir_E;

            // The 4-bit significand is either the four bits immediately
            // after the last leading zero, or the low four bits when E=0.
            if (ir_E == 4'd0) begin
                guard_bit = 1'b0;
            end
            else begin
                guard_bit = postabs_D[ir_E - 1'b1];
            end

            ir_F = {shifted_val[3:0], guard_bit};
        end
    end

endmodule
