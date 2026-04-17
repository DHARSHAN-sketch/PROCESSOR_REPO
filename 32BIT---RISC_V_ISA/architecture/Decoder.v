`timescale 1ns / 1ps

module decoder(
    input  [31:0] instruction,
    output reg [2:0] alu_ctrl,
    output reg [4:0] rs1,rs2,
    output reg regwrite,
    output reg alu_src
);
        
always @(*) begin
    //alu_ctrl = 3'b000;
     rs1=instruction[19:15];
     rs2=instruction[24:20];
     
     
     regwrite = 1'b0;
    case(instruction[6:0])

        7'b0110011: begin
            regwrite = 1'b1;
            alu_src  = 0;
            case(instruction[14:12])

                3'b000: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b000;
                    else if(instruction[31:25] == 7'b0100000)
                        alu_ctrl = 3'b001;
                end
                
                3'b111: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b010;
                end
                
                3'b110: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b011;
                end
                
                3'b100: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b100;
                end
                
                3'b001: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b101;
                end
                
                3'b101: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b110;
                end
                
                3'b010: begin
                    if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b111;
                end
                
                
        7'b0010011: begin
        regwrite = 1'b1;
        alu_src  = 1;
            case(instruction[14:12]) 

                 3'b000: alu_ctrl = 3'b000; // ADDI
                 3'b010: alu_ctrl = 3'b111; // SLTI
                 //3'b011: alu_ctrl = 3'b010; // SLTIU
                 //3'b010: alu_ctrl = 3'b010; //LW
                 3'b100: alu_ctrl = 3'b100; // XORI
                 3'b110: alu_ctrl = 3'b011; // ORI
                 3'b111: alu_ctrl = 3'b010; // ANDI
                 3'b001: alu_ctrl = 3'b101; // SLLI
                // 3'b010: alu_ctrl = 3'b111;                
                 3'b101: begin
                      if(instruction[31:25] == 7'b0000000)
                        alu_ctrl = 3'b110; // SRLI
                      else if(instruction[31:25] == 7'b0100000)
                        alu_ctrl = 3'b010; // SRAI      
                    end

    endcase
end
 /*       
        SLLI	0010011	001	0000000	shift left logical
SRLI	0010011	101	0000000	shift right logical
SRAI	0010011	101	0100000	shift right arithmetic
        
   */     
        
        default: alu_ctrl=3'b 000;
            endcase
        end
    endcase
end
endmodule
