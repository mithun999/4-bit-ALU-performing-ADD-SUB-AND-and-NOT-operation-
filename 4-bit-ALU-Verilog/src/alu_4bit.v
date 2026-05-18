
module alu_4bit(
  input  [3:0] A, B,
  input  [2:0] opcode,
  output [3:0] result
);
  wire [3:0] add_out, sub_out, and_out, or_out, not_out;
  wire  add_cout, sub_cout;

  adder_4bit  adder(.A(A), .B(B), .cin(1'b0), .sum(add_out), .cout(add_cout));
  adder_4bit  subber(.A(A), .B(~B),.cin(1'b1), .sum(sub_out), .cout(sub_cout));
  and_unit    ander(.A(A), .B(B),.result(and_out));
  or_unit     orer(.A(A), .B(B),.result(or_out));
  not_unit    noter(.A(A),.result(not_out));

  //Opcode feeds MUX as select line
  mux_5to1_4bit mux (
    .in0(add_out), .in1(sub_out),
    .in2(and_out),
    .in3(or_out),.in4(not_out),
    .select(opcode),
    .result(result));

endmodule