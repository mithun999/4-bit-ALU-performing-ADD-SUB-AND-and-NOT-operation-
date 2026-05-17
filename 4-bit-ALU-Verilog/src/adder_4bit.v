module adder_4bit(input [3:0]A,B,input cin
,output [3:0] sum,output cout);
wire a1,a2,a3;
full_adder add1(A[0],B[0],cin,sum[0],a1);// inistiating 4 full adder to get a 4bit adder
full_adder add2(A[1],B[1],a1,sum[1],a2);
full_adder add3(A[2],B[2],a2,sum[2],a3);
full_adder add4(A[3],B[3],a3,sum[3],cout);
endmodule