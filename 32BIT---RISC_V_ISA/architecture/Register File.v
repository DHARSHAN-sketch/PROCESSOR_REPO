`timescale 1ns / 1ps


module reg_file(
    input clk,
    input reset,
    input regwrite,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2
);



reg [31:0] registers [31:0] ;

integer i;

initial begin
registers[0]=32'h 00000000;
registers[1]=32'h 0000000a;
registers[2]=32'h 00000001;
registers[3]=32'h 000000ff;
registers[4]=32'h 0000000e;
end


assign read_data1 = (reset)? 32'h00000000 : registers[rs1];
assign read_data2 = (reset)? 32'h00000000 : registers[rs2];

/*
always @(posedge clk or posedge reset)
begin

    if(reset) begin
        for(i=0;i<32;i=i+1)
            registers[i] <= 32'b0;
    end
    else begin
  
        if(regwrite && rd != 0)
            registers[rd] <= write_data;

        registers[0] <= 32'b0;
    
end
*/
endmodule
