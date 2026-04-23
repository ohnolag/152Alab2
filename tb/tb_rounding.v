
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

    
endmodule