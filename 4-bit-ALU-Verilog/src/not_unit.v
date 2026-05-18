module not_unit(
  input  [3:0] A,
  output [3:0] result
);
  assign result[0] =~A[0];
  assign result[1] =~A[1];
  assign result[2] =~A[2];
  assign result[3] =~A[3];
endmodule