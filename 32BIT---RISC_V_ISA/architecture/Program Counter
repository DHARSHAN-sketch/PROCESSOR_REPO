`timescale 1ns / 1ps
module programcounter(
    input clk,
    input reset,
    output reg [31:0] programcounter
);
always @(posedge clk or posedge reset) begin
    if (reset)
    programcounter <= 32'b0;
    else
    programcounter <= programcounter + 4;
end
endmodule
