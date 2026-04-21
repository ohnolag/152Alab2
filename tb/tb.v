module tb

reg [11:0] D;
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

    D = 12'd0;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = 12'd5;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = 12'd56;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = 12'd128;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = 12'd1000;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = 12'd2047;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = -12'd5;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = -12'd128;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = -12'd1000;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = -12'd2047;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

    D = -12'd2048;  #10;
    $display("%d | %b | %d | %b" $signed(D), S, E, F);

end
endmodule