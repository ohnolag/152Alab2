`timescale 1ns/1ps

module leadzero_tb;
    reg  [11:0] postabs_D;
    wire [3:0] ir_E;
    wire [4:0] ir_F;

    integer errors;

    leadzero dut (
        .postabs_D(postabs_D),
        .ir_E(ir_E),
        .ir_F(ir_F)
    );

    task check_case;
        input [11:0] in_val;
        input [3:0]  expected_E;
        input [4:0]  expected_F;
        begin
            postabs_D = in_val;
            #1;

            $display(
                "postabs_D=%b | expected E=%b F=%b | got E=%b F=%b",
                in_val, expected_E, expected_F, ir_E, ir_F
            );

            if (ir_E !== expected_E || ir_F !== expected_F) begin
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

        $display("Starting leadzero testbench...");
        $display("--------------------------------");

        check_case(12'b000000000000, 4'b0000, 5'b00000);
        check_case(12'b000000000001, 4'b0000, 5'b00010);
        check_case(12'b000000001011, 4'b0000, 5'b10110);
        check_case(12'b000000010110, 4'b0001, 5'b10110);
        check_case(12'b000110100110, 4'b0101, 5'b11010);
        check_case(12'b100000000000, 4'b1000, 5'b10000);

        if (errors == 0) begin
            $display("PASS: leadzero testbench completed with no mismatches.");
        end else begin
            $display("FAIL: leadzero testbench found %0d mismatches.", errors);
        end

        $finish;
    end
endmodule
