module comp2signmag (
    input [11:0] D,
    output S,
    output [11:0] N
);

assign S = D[11];

assign N = S ? (~D + 12'd1) : D;
    
endmodule