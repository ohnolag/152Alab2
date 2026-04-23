module tb;

    reg signed [11:0] D;
    wire S;
    wire [2:0] E;
    wire [3:0] F;

    fpcvt uut(
        .D(D),
        .S(S),
        .E(E),
        .F(F)
    );

initial begin

    $display("   D | S | E | F");
    $display("----------------");

    D = 12'sd0;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = 12'sd5;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = 12'sd56;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = 12'sd128;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = 12'sd1000;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = 12'sd2047;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = -12'sd5;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = -12'sd128;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = -12'sd1000;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = -12'sd2047;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    D = -12'sd2048;  #10;
    $display("%4d | %b | %0d | %04b", D, S, E, F);

    $finish;
end
endmodule
