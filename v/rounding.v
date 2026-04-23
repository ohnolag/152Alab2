module rounding(
    input  [3:0] f_tmp,
    input  [2:0] e_tmp,
    input round_bit, //5th bit
    output reg [3:0] F,
    output reg [2:0] E
);

    reg [4:0] f_ext; //detect overflow check if 1
    

    always @(*) begin
        //no rounding truncate no change
        F = f_tmp;
        E = e_tmp;
        if (round_bit == 1'b1) begin

            f_ext = {1'b0, f_tmp} + 5'b00001; //extend to 5 bits to check for overflow
            if (f_ext[4] == 1'b1) begin
                //overflow
                if (e_tmp != 3'b111) begin
                    //shift right + 1 to exponent
                    E = e_tmp + 1;
                    F = 4'b1000;
                end else begin
                    //overflow
                    E = 3'b111;
                    F = 4'b1111;
                end
            end else begin
                //regular rounding
                F = f_ext[3:0];
                E = e_tmp;
            end
        end
    end
endmodule