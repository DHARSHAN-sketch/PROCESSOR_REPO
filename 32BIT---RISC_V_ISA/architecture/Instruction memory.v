`timescale 1ns / 1ps
module inst_memory(
    input [31:0] PC,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin
    $readmemh("program.mem", memory);
end

assign instruction = memory[PC[31:2]];

endmodule
