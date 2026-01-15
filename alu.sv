
module ALU #(
    parameter DATA_WIDTH = 32,
    parameter OP_CODE_WIDTH = 4
) (
    input logic [DATA_WIDTH - 1 : 0] in1, in2,
    input logic [OP_CODE_WIDTH - 1 : 0] op_code,
    output logic [DATA_WIDTH - 1 : 0] alu_output
);


    always_comb begin
        unique case (op_code) 
            4'b0000 : alu_output = in1 + in2; // ADD
            4'b0001 : alu_output = in1 - in2; // SUB
            4'b0010 : alu_output = in1 & in2; // AND
            4'b0011 : alu_output = in1 | in2; // OR
            4'b0100 : alu_output = in1 ^ in2; // XOR
            4'b0101 : alu_output = in1 << in2[4:0]; // SLL (shift left logical)
            4'b0110 : alu_output = in1 >> in2[4:0]; // SRL (shift right logical)
            4'b0111 : alu_output = $signed(in1) >>> in2[4:0]; // SRA (shift right arithmetic)
            4'b1000 : alu_output = (in1 < in2) ? 32'd1 : 32'd0; // SLTU (set less than unsigned)
            4'b1001 : alu_output = ($signed(in1) < $signed(in2)) ? 32'd1 : 32'd0; // SLT (set less than signed)

            // Default
            default : alu_output = '0;
        endcase
    end


endmodule

