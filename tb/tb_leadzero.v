`timescale 1ns/1ps

module leadzero_tb;
    reg  [11:0] postabs_D;
    wire [2:0] ir_E;
    wire [3:0] ir_F;
    wire       round_bit;

    integer errors;

    leadzero dut (
        .postabs_D(postabs_D),
        .ir_E(ir_E),
        .ir_F(ir_F),
        .round_bit(round_bit)
    );

    task check_case;
        input [11:0] in_val;
        input [2:0]  expected_E;
        input [3:0]  expected_F;
        input        expected_round_bit;
        begin
            postabs_D = in_val;
            #1;

            $display(
                "postabs_D=%b | expected E=%b F=%b R=%b | got E=%b F=%b R=%b",
                in_val, expected_E, expected_F, expected_round_bit, ir_E, ir_F, round_bit
            );

            if (ir_E !== expected_E || ir_F !== expected_F || round_bit !== expected_round_bit) begin
                errors = errors + 1;
                $display(
                    "RESULT: FAIL"
                );
            end else begin
                $display(
                    "RESULT: PASS"
                );
            end

            $display("");
        end
    endtask

    initial begin
        errors = 0;

        check_case(12'b000000000000, 3'b000, 4'b0000, 1'b0);
        check_case(12'b000000000001, 3'b000, 4'b0001, 1'b0);
        check_case(12'b000000001011, 3'b000, 4'b1011, 1'b0);
        check_case(12'b000000010110, 3'b001, 4'b1011, 1'b0);
        check_case(12'b000110100110, 3'b101, 4'b1101, 1'b0);
        check_case(12'b011111111111, 3'b111, 4'b1111, 1'b1);

        if (errors == 0) begin
            $display("PASS");
        end else begin
            $display("FAIL: %0d errors", errors);
        end

        $finish;
    end
endmodule
