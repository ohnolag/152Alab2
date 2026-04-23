

module fpcvt (

    input  [11:0] D,
    output        S,
    output reg [3:0] E,
    output reg [4:0] F
)

    wire [11:0] mag; 
    wire [2:0] e_temp; 
    wire [3:0] f_temp; 
    wire round_bit; 

    comp2signmag u_abs(
        .D(D),
        .S(S),
        .M(mag)
    )

    leadzero u_lz ( 
        .postabs_D(mag),
        .e_tmp(e_temp),
        .f_tmp(f_temp),
        .round_bit(round_bit)
    )

    rounding u_round (
        .f_tmp(f_temp),
        .e_tmp(e_temp),
        .round_bit(round_bit),
        .F(F),
        .E(E)
    );

endmodule 