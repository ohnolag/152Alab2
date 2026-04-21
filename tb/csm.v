module tb_csm;

reg [11:0] D;
wire s;
wire [11:0] N;

comp2signmag uut(
    .D(D),
    .S(S),
    .N(N)
);

initial begin
    $display("   D (dec)    | S |   N (dec)");
    $display("-----------------------------");

    // Test cases
    D = 12'd0;       #10;
    $display("%d | %b | %d", $signed(D), S, N);

    D = 12'd5;       #10;
    $display("%d | %b | %d", $signed(D), S, N);

    D = -12'd5;      #10;
    $display("%d | %b | %d", $signed(D), S, N);

    D = 12'd2047;    #10;
    $display("%d | %b | %d", $signed(D), S, N);

    D = -12'd2048;   #10; // edge case
    $display("%d | %b | %d", $signed(D), S, N);

    $finish;
end

endmodule