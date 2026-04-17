`timescale 1ns / 1ps
module ALU (A,B,ALU_CON,cout,res);
input [31:0] A,B;
input [2:0] ALU_CON;

output reg [31:0] res;
output reg cout;
reg [31:0] sum;
always @(*) begin



case (ALU_CON)
3'b000: begin
    {cout,sum} = A + B;
    res = sum;
end
3'b001: begin
    {cout,sum} = A - B;
    res = sum;
end

3'b010: begin res = A & B; cout=1'b0;  end
3'b011: begin res = A | B; cout=1'b0;  end
3'b100: begin res = A ^ B; cout=1'b0;  end
3'b101: begin res = A << B[4:0]; cout=1'b0;  end
3'b110: begin res = A >> B[4:0]; cout=1'b0;  end
3'b111: begin
        if (A < B)
          res = 32'b00000001;
          
        else
          res = 32'b00000000;
        end
default: res = 32'b0;
endcase
end
endmodule
