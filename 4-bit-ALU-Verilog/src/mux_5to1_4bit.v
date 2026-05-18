module mux_5to1_4bit(
  input  [3:0] in0, in1, in2, in3, in4,
  input  [2:0] select,
  output reg [3:0] result
);
  always @(*) begin
    case(select)
      3'b000: result = in0;  // ADD
      3'b001: result = in1;  // SUB
      3'b010: result = in2;  // AND
      3'b011: result = in3;  // OR
      3'b100: result = in4;  // NOT
      default: result = 4'b0000;
    endcase
  end
endmodule