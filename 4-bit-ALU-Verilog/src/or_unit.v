module or_unit(
  input  [3:0] A, B,
  output [3:0] result
);
  assign result[0] = A[0] | B[0];
  assign result[1] = A[1] | B[1];
  assign result[2] = A[2] | B[2];
  assign result[3] = A[3] | B[3];
endmodule