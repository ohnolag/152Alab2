
module tb_rounding;

    reg  [3:0] f_tmp;
    reg  [2:0] e_tmp;
    reg  round_bit;

    wire [3:0] F;
    wire [2:0] E;

    rounding uut (
        .f_tmp(f_tmp),
        .e_tmp(e_tmp),
        .round_bit(round_bit),
        .F(F),
        .E(E)
    );
    initial begin
    f_tmp = 4'b1011;
    e_tmp = 3'b010;
    round_bit = 1'b1;

    #1;

    $display("f_tmp=%b e_tmp=%b round_bit=%b -> F=%b E=%b", f_tmp, e_tmp, round_bit, F, E);

    $finish;
end
    
endmodule